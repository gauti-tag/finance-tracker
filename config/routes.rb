Rails.application.routes.draw do

  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'welcome#index'
  get 'my_porfolio', to: 'users#my_porfolio'
  get 'my_friends', to: 'users#my_friends'
  get 'search_stocks', to: 'stocks#search'
end
