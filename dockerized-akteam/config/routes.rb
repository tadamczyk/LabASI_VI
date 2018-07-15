# frozen_string_literal: true

Rails.application.routes.draw do
  resources :visits
  resources :patients
  resources :doctors

  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
