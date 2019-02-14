Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get '/login', to: 'sessions#new'
  get '/sessions', to: 'sessions#index'
  post '/sessions', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  patch '/favorite', to: 'user_feedbacks#favorite', as: 'favorite'
  delete '/favorite', to: 'user_feedbacks#favorite_destroy_all'

  delete '/comments', to: 'user_feedbacks#comment_destroy_all', as: 'comment'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :breads
  resources :spreads
  resources :sandwiches
  resources :users
  resources :user_feedbacks
  get '/', to: 'application#index'
end
