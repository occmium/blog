Rails.application.routes.draw do
  devise_for :people
  root "articles#index"

  resources :articles do
    put "like", to: "articles#revote"
    resources :comments, only: [:create, :destroy] do
      put "like", to: "comments#revote"
    end
  end
  resources :people, only: [:index, :show, :edit, :update, :destroy]
end
