Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  root 'static_pages#index'

  resources :products, only: %i[index show]
  resources :categories, only: %i[show]

  resource :cart, only: %i[show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
    put 'remove_one/:product_id', to: 'carts#removeone', as: :remove_one
  end

  namespace :admin do
    root to: 'products#index'
    resources :products, except: %i[show]
    resources :categories, except: %i[show]
  end
end
