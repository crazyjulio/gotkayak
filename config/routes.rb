Rails.application.routes.draw do
  resources :trips, only: %i[show]
  resources :waterbodies, only: %i[show index]

  get 'admin', to: 'admin/dadmins#index'

  devise_for :dadmins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'clearance', to: 'clearance_items#index'
  get 'faqs', to: 'questions#index'
  get 'contact', to: 'static#contact'
  get 'about', to: 'static#about'
  get 'choosing-a-kayak', to: 'static#choosing_a_kayak'
  get 'warranty', to: 'static#warranty'
  get 'adventures', to: 'waterbodies#index'
  get 'adventure/:name', to: 'waterbodies#show'
  get 'adventure/:name/:trip_name', to: 'trips#show'
  get 'error', to: 'static#test_five_hundreds'

  root to: 'static#index'
end
