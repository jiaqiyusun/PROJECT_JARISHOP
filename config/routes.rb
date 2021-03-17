Rails.application.routes.draw do
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :sessions
  delete '/logout' => 'sessions#destroy' , as: :logout

  namespace :admin do
    root 'sessions#new'
    resources :sessions
    resources :categories
  end

end
