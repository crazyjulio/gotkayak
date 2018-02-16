Gotkayak::Application.routes.draw do
  resources :events

  resources :clearance_items

  resources :products do
    member do
      get :versions
    end
  end

  get "admin", :to => "admin#index"
  put "update_admin_profile", :to => "admin#update_admin_profile"

  resources :questions

  resources :trips

  resources :waterbodies

  resources :water_types

  devise_for :dadmins

  resources :images do
    member do
      get :models
    end
  end

  resources :features

  resources :manufacturers do
    member do
      get :products
      get :features
      get :colors
    end
  end

  resources :colors

  resources :versions

  resources :paddlers

  #match '/auth/:provider/callback', :to => 'sessions#callback'


  #static routes
  get "kayaks", :to => "kayaks#index"
  get "kayaks/:manufacturer", :to => "kayaks#manufacturers_kayaks"
  get "kayaks/:manufacturer/:kayak", :to => "kayaks#manufacturer_kayak"
  #get "kayaks", :to => "static#kayaks"
  #get "sierra_10", :to => "static#sierra_10"
  #get "mini_x", :to => "static#mini_x"
  #get "x_factor", :to => "static#x_factor"
  #get "pro_explorer", :to => "static#pro_explorer"
  #get "x_13", :to => "static#x_13"
  #get "pro2_tandem", :to => "static#pro2_tandem"
  #get "stealth_12", :to => "static#stealth_12"
  #get "stealth_14", :to => "static#stealth_14"
  get "clearance", :to => "static#clearance"
  get "faqs", :to => "static#faqs"
  get "contact", :to => "static#contact"
  get "warranty", :to => "static#warranty"
  get "adventures", :to => "static#adventures"
  get "adventure/:name", :to => "static#adventure"
  get "adventure/:name/:trip_name", :to => "static#adventure"

  root :to => "static#index"
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
