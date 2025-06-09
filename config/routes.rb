Rails.application.routes.draw do
  devise_for :users
  resources :users , only: [:show, :index]
  resources :bands, only: [:show, :index] do
    resources :vacancies, only: [:create]
  end

<<<<<<< HEAD
  resources :users, only: [:show, :index]
=======
  resources :posts, only: [:index, :show, :create]

  resources :users , only: [:show, :index]
>>>>>>> f53075f27ae33bbae76e318ce020c59500ec504a
  get "about", to: "pages#about"
  
  resources :applications, only: [:index, :show, :destroy]
  resources :vacancies, only: [:index, :show] do
    resources :applications, only: [:create]
  end

  root to: "pages#home"
  get "about", to: "pages#about"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
