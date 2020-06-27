Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  'sessions#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get "/auth/:provider/callback" => 'sessions#omniauth'
  
  
  
  resources :users do 
      resources :diaries, only: [:index] 
  end 
  resources :diaries do 
      resources :foods, only: [:new, :create]
  end 
  resources :foods
  resources :diary_entries


end
