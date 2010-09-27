ActionController::Routing::Routes.draw do |map|
  map.resources :trustee_candidates

  map.resources :school_wards

  map.resources :school_divisions

  map.resources :news_articles, :member => { :approve => :post, :reject => :post }, :collection => { :latest => :get}, :paged => { :latest => true }

  map.resources :pages

  map.resources :wards

  map.resources :candidates
  

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  
  map.root :controller => 'info'
  
  map.connect '/ward/:ward_name', :controller => 'info', :action => 'ward'
  map.connect '/school_ward/:division_name/:ward_name', :controller => 'info', :action => 'school_ward'
  map.connect '/candidate/:candidate_name', :controller => 'info', :action => 'candidate'
  
  map.static ':permalink', :controller => 'pages', :action => 'show'
  map.paged_candidate '/pages/:page_id/candidate/:candidate_name', :controller => 'info', :action => 'candidate'
  
  map.connect '/feeds/candidate/:candidate_name.:format', :controller => 'feeds', :action => 'candidate', :requirement => { :format => 'atom'}
  map.connect '/feeds/ward/:ward_name.:format', :controller => 'feeds', :action => 'ward', :requirement => { :format => 'atom'}
  map.latest_feed '/feeds/latest_news.:format', :controller => 'feeds', :action => 'latest_news', :requirement => { :format => 'atom'}
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
