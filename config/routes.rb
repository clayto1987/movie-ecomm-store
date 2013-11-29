MovieEcommStore::Application.routes.draw do
  root :to => 'store#index', :as => 'home', :via => :get
  match '/products' => 'movieproducts#index', :as => 'all_movieproducts', :via => :get
  match '/products/new-releases' => 'movieproducts#newest_products', :as => 'new_products', :via => :get
  match '/products/updated-products' => 'movieproducts#updated_products', :as => 'updated_products', :via => :get
  ###match '/products/search-results' => 'store#search_results', :as => 'search_results', :via => :post
  match '/products/search-results' => 'store#search_results', :as => 'search_results', :via => :get
  match '/products/:id' => 'movieproducts#show', :as => 'movieproduct', :via => :get
  match '/category/:name/products' => 'categories#index', :as => 'products_for_category', :via => :get
  match '/store/add-to-cart/:id' => 'store#add_to_cart', :as => 'add_to_cart', :via => :post
  match '/store/remove-from-cart/:id' => 'store#remove_from_cart', :as => 'remove_from_cart', :via => :post
  match '/store/reset-cart' => 'store#reset_cart', :as => 'reset_cart', :via => :post
  match '/store/cart' => 'store#view_cart', :as => 'view_cart', :via => :get
  match '/store/:id/:permalink' => 'store#static_page', :as => 'static_page', :via => :get
  match '/store/checkout' => 'store#checkout_start', :as => 'checkout_start', :via => :get
  match '/store/checkout' => 'store#checkout_finish', :as => 'checkout_finish', :via => :post


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
