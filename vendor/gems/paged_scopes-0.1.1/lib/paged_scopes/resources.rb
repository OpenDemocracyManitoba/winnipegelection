module PagedScopes
  module Resources
    def resources_with_paged(*entities, &block)
      options = entities.extract_options!

      if paged_options = options.delete(:paged)
        resources_without_paged(*(entities.dup << options), &block)        
        
        paged_options = {} unless paged_options.is_a? Hash
        paged_as = paged_options.delete(:as)
        paged_name = paged_options.delete(:name)
        
        if paged_options.empty?
          unless (options[:only] && ![ options[:only] ].flatten.include?(:index)) || (options[:except] && [ options[:except] ].flatten.include?(:index))
            paged_options[:index] = true
          end
          options[:collection].each { |collection, methods| paged_options[collection] = true if [ methods ].flatten.include? :get } if options[:collection]
        end

        paged_options.each_pair do |action, page_options|
          page_options = {} unless page_options.is_a? Hash
          page_options.reverse_merge! :name => paged_name unless paged_name.blank?
          page_options.reverse_merge! :as => paged_as unless paged_as.blank?
          page_options.merge! :only => :none
          
          preserved_options = ActionController::Resources::INHERITABLE_OPTIONS + [ :name_prefix, :path_prefix ]
          
          with_options(options.slice(*preserved_options)) do |map|
            map.resources_without_paged(page_options.delete(:name) || :pages, page_options) do |page|
              entities_options = action == :index ?
                { :only => :index, :as => options[:as] } :
                { :only => :none,  :as => options[:as], :collection => { action => :get } }
              page.resources(*(entities.dup << entities_options))
            end
          end
        end
      else
        resources_without_paged(*(entities << options), &block)
      end
    end
    
    def self.included(base)
      base.class_eval do
        alias_method_chain :resources, :paged
      end
    end
  end
end

if defined? ActionController::Resources
  ActionController::Resources.send :include, PagedScopes::Resources
end
