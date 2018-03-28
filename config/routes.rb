Rails.application.routes.draw do
  resources :trips, only: %i[show]
  resources :waterbodies, only: %i[show index]
  resources :fish do
    collection do
      get 'species'
      get 'locations'
    end
  end
  resources :competitions, only: %i[show index]

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get 'profile/edit', to: 'profile#edit'
  get 'profile', to: 'profile#show'
  get 'profile/:id', to: 'profile#show_other_users_profile', as: 'other_user_profile'
  put 'update_profile/:id', to: 'profile#update', as: 'update_profile'

  devise_for :dadmins, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)
  get 'admin', to: 'admin/dadmins#index'

  get 'competition/:year', to: 'competitions#show'
  get 'competition/:year/disputes', to: 'competitions#disputes', as: 'disputes'
  get 'clearance', to: 'clearance_items#index'
  get 'faqs', to: 'questions#index'
  get 'contact', to: 'static#contact'
  get 'about', to: 'static#about'
  get 'choosing-a-kayak', to: 'static#choosing_a_kayak'
  get 'warranty', to: 'static#warranty'
  get 'adventures', to: 'waterbodies#index'
  get 'adventure/:name', to: 'waterbodies#show'
  get 'adventure/:name/:trip_name', to: 'trips#show'

  post 'dispute', to: 'fish#dispute'
  post 'resolve_dispute', to: 'fish#resolve_dispute'
  post 'comment', to: 'fish#comment'
  post 'edit_comment', to: 'fish#edit_comment'

  root to: 'static#index'
end
