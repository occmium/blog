Rails.application.routes.draw do
  devise_for :people
  root "articles#index"

  resources :articles
  resources :people, only: [:index, :show, :edit, :update, :destroy]
end
