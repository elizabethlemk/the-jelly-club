Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :breads
  resources :spreads
  resources :sandwiches
  resources :users
  get '/', to: 'application#index'
end
