Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/login' => 'sessions#create'

  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'
  # post '/logout' => 'sessions#destroy'

  # resources :users, only: [:new, :create]

  root 'welcome#home'
end
