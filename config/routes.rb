NerdNews::Application.routes.draw do
  resources :posts
  resources :users
  resources :sessions
  resources :votes

  get 'logout', to: 'sessions#destroy', as: 'logout'
  root :to => 'posts#index'
end
