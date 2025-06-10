Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show, :index] do
    resources :bands, only: [:new, :create]
    resources :chats, only: [:create]
    resources :posts, only: [:create]
  end

  resources :bands, only: [:show, :index] do
    resources :vacancies, only: [:create, :destroy]
    resources :chats, only: [:create]
  end

  resources :chats, only: [:index, :show] do
    resources :messages, only: [:create]
  end

  resources :posts, only: [:index, :show]

  resources :applications, only: [:index, :show, :destroy]

  resources :vacancies, only: [:index, :show] do
    resources :applications, only: [:create]
  end

  get "about", to: "pages#about"
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
