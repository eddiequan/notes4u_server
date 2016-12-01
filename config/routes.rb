Rails.application.routes.draw do
  resources :users do
    resources :ratings, :replies, :requests
  end

  get '/replies/accepted_requests/:id', to: 'replies#accepted'
  resources :courses
  resources :replies
  resources :ratings

  resources :requests do
    resources :replies, :courses
  end

  root to: 'users#index'
  post '/users/login', to: 'users#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
