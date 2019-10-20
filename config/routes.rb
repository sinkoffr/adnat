Rails.application.routes.draw do
  devise_for :users

  root 'organisations#index'
  resources :organisations

  resources :users

end
