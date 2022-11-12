Rails.application.routes.draw do


  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

 # get "files/index"
  resources :members
  root 'members#index'
  resources :transactions
  resources :budgets
  resources :events
  resources :shifts
  resources :attendances
  resources :files
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  put "sign_in" =>'attendances#sign_in'
end