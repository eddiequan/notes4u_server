Rails.application.routes.draw do
  resources :users
  resources :users do
    resources :ratings
    resources :replies
    resources :requests
  end

  resources :courses
  resources :replies
  resources :requests
  resources :requests do
    resources :replies
    resources :courses
  end

  post '/users/login', to: 'users#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
