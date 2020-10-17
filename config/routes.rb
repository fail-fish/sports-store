Rails.application.routes.draw do
  root 'static_pages#index'

  resources :products, only: %i[index show]
  resources :categories, only: %i[show]
end
