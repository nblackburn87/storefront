SundriesStore::Application.routes.draw do

  root to: 'products#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :products
  resources :users, :only => [:new, :create]
  resources :sessions
end
