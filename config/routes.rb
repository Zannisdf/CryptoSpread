Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :coins, only: %i[index show] do
    resources :comments, only: :create
    resources :portfolios, only: :create
    get 'chart_data', to: 'coins#chart_data', on: :collection
  end
  resources :portfolios, only: %i[index update]
  resources :comments, only: %i[edit update destroy]
  resources :users, except: %i[new create destroy]
  root 'coins#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
