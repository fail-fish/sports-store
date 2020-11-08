Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'

  resources :products, only: %i[index show]
  resources :categories, only: %i[show]
end
