# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  root 'users#index'

  resources :users , only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      post 'createlike', on: :member
      delete 'deletelike', on: :member
      resources :comments, only: [:new, :create, :destroy]
    end
  end

  # Api endpoints
  namespace :api do
    resources :users, only: [:index] do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
    end
  end
end
