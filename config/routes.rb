Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'user/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :transactions
  resources :budgets
  resources :events
  resources :shifts
  resources :attendances
  resources :members
  root 'members#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
