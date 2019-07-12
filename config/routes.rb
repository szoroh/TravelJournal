# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#welcome'

  # routes for Google authentication
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :trips, only: [:new, :create]

  authenticated do
    root 'trips#new'
  end
end
