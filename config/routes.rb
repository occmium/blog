# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :people
  root 'articles#index'

  resources :articles do
    put 'like', to: 'articles#revote'
    resources :comments, only: %i[create destroy] do
      put 'like', to: 'comments#revote'
    end
  end
  resources :people, only: %i[index show edit update destroy]
end
