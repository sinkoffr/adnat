Rails.application.routes.draw do
  devise_for :users

  root 'organisations#index'
  resources :organisations do

    resources :organisation_enrollments, only: :create

    namespace :organisation do
      resources :shifts, only: [:new, :create, :index]
    end

  end

  resources :users

end
