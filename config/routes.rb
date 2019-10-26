Rails.application.routes.draw do
  devise_for :users

  root 'organisations#index'
  resources :organisations do
    resources :organisation_enrollments, only: [:create, :destroy]
    resources :shifts, only: [:new, :create, :index]

  end

  resources :users

end
