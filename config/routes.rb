Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    get 'logout', to: 'devise/sessions#destroy'
  end
  resources :posts
  resources :users, only: :show

  get 'users', to: 'static_pages#users'

  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
