Rails.application.routes.draw do
  devise_for :people
  root "articles#index"

  resources :articles do
    member do
      put "like", to: "articles#revote"
    end
    resources :comments, only: [:create, :destroy]
  end
  resources :people, only: [:index, :show, :edit, :update, :destroy]
end
