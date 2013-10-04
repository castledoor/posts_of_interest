NerdNews::Application.routes.draw do
  resources :posts
  resources :users
  resources :sessions
  resources :votes
  resources :comments

  get 'logout', to: 'sessions#destroy', as: 'logout'
  root :to => 'posts#index'
end
