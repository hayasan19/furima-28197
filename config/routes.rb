Rails.application.routes.draw do
  get 'categories/new'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:create, :index]
  end
end
