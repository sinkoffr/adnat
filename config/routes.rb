Rails.application.routes.draw do
  devise_for :users

  root 'organisations#index'
  resources :organisations do
    resources :organisation_enrollments, only: :create
    resources :shifts, only: [:update, :index]
  end

  resources :users

end
