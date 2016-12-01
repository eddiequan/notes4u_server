Rails.application.routes.draw do
  resources :users do
    resources :ratings, :replies, :requests
  end

  get '/replies/accepted/:id', to: 'replies#accepted'
  # put '/replies/:id/accept_request', to: 'replies#accept_request'
  resources :courses
  resources :replies do
    member do
      put 'approve_request'
    end
  end
  resources :ratings

  get '/notifications/new_notifications/:user_id', to: 'notifications#new_notifications'
  resources :notifications

  resources :requests do
    resources :replies, :courses
  end

  root to: 'users#index'
  post '/users/login', to: 'users#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
