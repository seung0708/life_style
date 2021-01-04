Rails.application.routes.draw do
  root  'sessions#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#omniauth'
  
  
  
  resources :users do 
      resources :diaries, only: [:index] 
  end 
  resources :diaries do 
      resources :foods, only: [:new, :create]
  end 
  resources :foods
  resources :diary_entries


end
