Rails.application.routes.draw do
  root "dashboard#index"

  namespace :admin do
    resources :plans
  end

  resources :services, only: [:index, :edit]
  resources :notifications, only: [:index, :edit, :new]
end
