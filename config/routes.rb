Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: :registrations, sessions: :sessions}
  get 'pages/index'

  namespace :api do
    resources :product_pages
  end

  root to: 'pages#index'
  
end
