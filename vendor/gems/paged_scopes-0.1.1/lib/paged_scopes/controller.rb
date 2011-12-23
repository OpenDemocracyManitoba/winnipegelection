module PagedScopes
  module Controller
    module ClassMethods
      def paginate(*args)
        options = args.extract_options!
        raise ArgumentError, "can't paginate multiple collections with one call" if args.many?
        collection_name = args.first || default_collection_name
        callback_method = "paginate_#{collection_name}"
        define_method callback_method do
          collection = instance_variable_get("@#{collection_name.to_s.pluralize}")
          raise RuntimeError, "no @#{collection_name.to_s.pluralize} collection was set" unless collection
          object = instance_variable_get("@#{collection_name.to_s.singularize}")
          page = page_for(collection, object, options)
          instance_variable_set("@#{collection.pages.name.underscore}", page)
        end
        protected callback_method
        before_filter callback_method, options.except(:per_page, :name, :path)
      end
      
      private
      
      def default_collection_name
        collection_name = name
        raise RuntimeError, "couldn't find controller name" unless collection_name.slice!(/Controller$/)
        collection_name.demodulize.tableize
      end
    end
    
    def self.included(base)
      base.extend ClassMethods
      base.rescue_responses.update('PagedScopes::PageNotFound' => :not_found)
    end
    
    private
    
    def page_for(collection, *args, &block)
      options = args.extract_options!
      collection.per_page = options[:per_page] if options[:per_page]
      collection.page_name = options[:name] if options[:name]
      object = args.first
      returning collection.pages.find_by_object(object) || collection.pages.from_params!(params) || collection.pages.first do |page|
        if options[:path]
          page.paginator.set_path { |pg| send(options[:path], pg) }
        elsif block_given?
          page.paginator.set_path(&block)
        end
      end
    end
  end
end

if defined? ActionController::Base
  ActionController::Base.send :include, PagedScopes::Controller
end
