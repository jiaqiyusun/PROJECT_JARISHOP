Rails.application.routes.draw do
  root 'welcome#index'

  resources :users
  resources :sessions
  delete '/logout' => 'sessions#destroy', as: :logout

  resources :categories, only: [:show]
  resources :products, only: [:show]
  resources :shopping_carts


  namespace :admin do
    root 'sessions#new'
    resources :sessions
    resources :categories
    resources :products do
      resources :product_images, only: [:index, :create, :destroy, :update]
    end
  end
end
