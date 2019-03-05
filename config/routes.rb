Rails.application.routes.draw do
  devise_for :users
  resources :coins, only: %i[index show] do
    resources :comments, only: :create
    resources :portfolios, only: :create
  end

  root 'coins#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
