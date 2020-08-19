Rails.application.routes.draw do
  
  devise_for :users
  root 'home#top'
  get 'home/about'
  
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show,:index,:edit,:update, :create]

end