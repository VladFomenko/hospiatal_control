# frozen_string_literal: true

Rails.application.routes.draw do
  root 'articles#index'

  resources :clients do
    resources :visits, only: %i[index show create delete]
  end
  resources :doctors do
    resources :visits, only: %i[index show update]
    post 'set_category', on: :member
  end
end
