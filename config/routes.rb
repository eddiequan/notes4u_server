Rails.application.routes.draw do
  resources :users do
    resources :ratings, :replies, :requests
  end

  resources :courses
  resources :replies

  resources :requests do
    resources :replies, :courses
  end

  root to: 'users#index'
  post '/users/login', to: 'users#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
