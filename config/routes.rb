Rails.application.routes.draw do
  get 'categories/index'

  resources :home
  resources :accounts
  resources :categories
  # get 'accounts/index'
  # get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
