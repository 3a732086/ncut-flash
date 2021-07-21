Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/ncut-admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    # omniauth_callbacks: "users/omniauth_callbacks",
    unlocks: 'users/unlocks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"


  resources :flashes

  resources :user_infos

  resources :admin do
    collection do
      get :user_manage
      get :user_response
      get :click_rates
    end
  end

  resources :user

  resources :ctrs

end
