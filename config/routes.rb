Rails.application.routes.draw do
  authenticated :user, ->(user) { user.moderator? || user.admin? || user.user? } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
  resources :projects do 
    resources :tasks
    resources :comments
  end
  devise_for :users

  root 'home#homepage'
  get 'homepage', to: 'home#homepage'
  get 'dashboard', to: 'home#dashboard'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
