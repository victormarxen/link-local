Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :categories, only: %i[index show]
  resources :favourites, only: %i[index create destroy]

  get "my_profile", to: "users#my_profile"
end
