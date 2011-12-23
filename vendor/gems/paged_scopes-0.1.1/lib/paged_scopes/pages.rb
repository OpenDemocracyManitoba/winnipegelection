module PagedScopes
  class PageNotFound < ActiveRecord::RecordNotFound
    attr_reader :substitute
    def initialize(message, substitute = nil)
      super(message)
      @substitute = substitute
    end
  end
  
  module Page
    extend ActiveSupport::Memoizable

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      extend ActiveSupport::Memoizable
      include Enumerable
      
      attr_accessor :proxy
      
      def per_page
        proxy.per_page || raise(RuntimeError, "please specify per_page in your collection")
      end
      
      def name
        proxy.page_name
      end
        
      def find(id)
        new(id.to_i)
      end
      
      memoize :find

      def find_by_object!(object)
        raise PageNotFound, "#{object.inspect} is not an ActiveRecord instance" unless object.is_a?(ActiveRecord::Base)
        find(1 + proxy.index_of(object) / per_page)
      rescue ActiveRecord::RecordNotFound
        raise PageNotFound, "#{object.inspect} not found in scope"
      end
            
      def find_by_object(object)
        find_by_object!(object)
      rescue PageNotFound
        nil
      end
      
      def from_params!(params)
        number = params[name.underscore.foreign_key.to_sym]
        number ? find(number) : nil
      end

      def count
        collection_count = if proxy_scoped?(:limit)
          count_options = { :distinct => true, :limit => 1 }
          count_options.merge!(:offset => 0) if proxy_scoped?(:offset)
          proxy_count = proxy.count("#{proxy.table_name}.#{proxy.primary_key}", count_options)
          proxy_count -= proxy_options[:offset] if proxy_scoped?(:offset)
          [ proxy_count, proxy_options[:limit] ].min
        else
          proxy.count("#{proxy.table_name}.#{proxy.primary_key}", :distinct => true)
        end
        [ (collection_count - 1)/per_page + 1, 1].max
      end
      
      memoize :count

      def first
        find(1)
      end

      def last
        find(count)
      end

      def each(&block)
        1.upto(count) { |number| yield find(number) }
      end

      def all
        collect { |page| page }
      end
      
      def closest_to(number)
        closest_number = [ [ 1, number ].max, count ].min
        closest_number > 0 ? find(closest_number) : nil ## TODO this is unneeded now!
      end
      
      def reload!
        unmemoize_all
      end
      
      private
      
      def proxy_options
        proxy.send(:scope, :find) || {}
      end
                  
      def proxy_scoped?(key = nil)
        proxy.send(:scoped?, :find, key)
      end
    end
    
    attr_reader :number, :paginator
    delegate :per_page, :proxy, :proxy_options, :proxy_scoped?, :to => "self.class"
    private :proxy, :proxy_options, :proxy_scoped?

    def initialize(number)
      unless number > 0 && number <= page_count
        raise PageNotFound.new("couldn't find page number #{number}", self.class.closest_to(number))
      end
      @number = number
      @paginator = PagedScopes::Paginator.new(self)
    end
    
    def reload!
      self.class.reload!
      self.class.find(number)
      unmemoize_all
    end
    
    def page_count
      self.class.count
    end
    
    def first?
      number == 1
    end
    
    def last?
      number == page_count
    end
    
    def <=>(other)
      number <=> other.number
    end
    
    def ==(other)
      other.is_a?(self.class) && number == other.number
    end
    
    def full?
      !last? || page_scope.all.length == per_page # TODO: could improve this to calculate mathematically
    end
    
    def to_param
      number.to_s
    end
    
    def id
      number
    end
    
    def previous
      self.class.find(number - 1) unless first?
    end

    def next
      self.class.find(number + 1) unless last?
    end
    
    def offset(n)
      self.class.find(number + n)
    rescue PageNotFound
      nil
    end
        
    def inspect
      "#<#{self.class.name}, for: #{proxy.name}, number: #{number}>"
    end
    
    def page_scope
      if proxy_scoped?(:limit)
        subquery_sql = proxy.name.constantize.send(:construct_finder_sql, proxy_options.merge(:select => "#{proxy.table_name}.#{proxy.primary_key}"))
        paged_conditions = "#{proxy.table_name}.#{proxy.primary_key} IN (#{subquery_sql})"
        paged_options = { :conditions => paged_conditions, :limit => per_page, :offset => (number - 1) * per_page }
        proxy.name.constantize.scoped(proxy_options.except(:limit, :offset)).scoped(paged_options)
        # can't exclude :conditions since it won't work for has_many :through associations (multiple identical records returned)
      else
        proxy.scoped(:limit => per_page, :offset => (number - 1) * per_page)      
      end
    end
    
    private
    
    def subquery_sql
      proxy.name.constantize.send(:construct_finder_sql, proxy_options.merge(:select => "#{proxy.table_name}.#{proxy.primary_key}"))
    end
    
    memoize :subquery_sql
  end
end
