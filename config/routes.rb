# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users , only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      post 'createlike', on: :member
      delete 'deletelike', on: :member
      resources :comments, only: [:new, :create, :destroy]
    end
  end
end
