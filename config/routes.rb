# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :visits
    resources :categories
    resources :clients
    resources :doctors

    root to: 'clients#index'
  end

  devise_for :doctors
  devise_for :clients

  root 'main#home'

  resources :clients do
    resources :visits, only: %i[index show create delete new]
  end
  resources :doctors do
    resources :visits, only: %i[index show update edit]
  end

  resources :categories
end
