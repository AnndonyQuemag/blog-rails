Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  #root "articles#index"

  resources :articles do
    resources :comments
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root "articles#index"
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get "/signup", to: "users#new", as: "signup"
  get "/login", to: "sessions#new", as: "login"
  get "/logout", to: "sessions#destroy", as: "logout"
  

  #resources :articles
  #get "/articles", to: "articles#index"
  #get "/articles/:id",  to: "articles#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
