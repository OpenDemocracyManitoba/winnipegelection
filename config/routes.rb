Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  patch 'admin/news_sources/:id/toggle_is_local_source', to: 'admin/news_sources#toggle_is_local_source', as: 'admin_toggle_is_local_source'
  patch 'admin/news_articles/:id/change_moderation/:moderation', to: 'admin/news_articles#change_moderation', as: 'admin_change_moderation'

  get 'candidate/:name_slug', to: 'people#redirect_show'
  get 'pages/:id/candidate/:name_slug', to: 'people#redirect_show', constraints: {id: /\d+/}

  get 'pages/:id/:slug', to: 'pages#show', as: :page, constraints: {id: /\d+/}
  get 'people/:id/:slug(/page/:page)', to: 'people#show', as: 'person', constraints: {id: /\d+/}

  get 'electoral_races/:id/:slug', to: 'electoral_races#show', as: :electoral_race, constraints: {id: /\d+/}
  get 'electoral_races/council', to: 'electoral_races#council', as: :electoral_races_council

  root to: 'home#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
