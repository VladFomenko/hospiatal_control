# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :doctors
  devise_for :clients

  root 'main#home'

  resources :clients do
    resources :visits, only: %i[index show create delete new]
  end
  resources :doctors do
    resources :visits, only: %i[index show update edit]
    post 'set_category', on: :member
  end
end
