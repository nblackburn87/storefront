SundriesStore::Application.routes.draw do

root to: 'products#index'

resources :products, :only => [:index, :new, :create]
end
