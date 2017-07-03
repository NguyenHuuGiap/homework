Rails.application.routes.draw do
  root "dashboard#index"

  resources :services, only: [:index, :edit]
  resources :notifications, only: [:index, :edit, :new]
end
