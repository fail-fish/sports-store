Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root 'static_pages#index'

  resources :products, only: %i[index show]
  resources :categories, only: %i[show]

  namespace :admin do
    root to: 'products#index'
    resources :products, except: %i[show]
    resources :categories, except: %i[show]
  end
end
