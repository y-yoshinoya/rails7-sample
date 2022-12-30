Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'force_login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  scope constraints: ->(request) { request.env['warden'].user.nil? } do
    get "login", to: "sessions#new", as: "login"
  end

  # Defines the root path route ("/")
  # root "articles#index"
  get 'home/index'
  root 'home#index'
end
