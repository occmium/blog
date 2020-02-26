Rails.application.routes.draw do
  root "articles#index"

  resources :articles
  resources :people, only: [:show, :edit, :update, :destroy]
end
