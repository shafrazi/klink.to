Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: :registrations, sessions: :sessions }
  get 'pages/index'

  namespace :api do
    resources :product_pages, param: :slug
    resources :link_items
    resources :link_item_data, only: [:create]
  end

  root to: 'pages#index'

  post '/api/scrape', to: 'api/scrapes#scrape'

  get '/api/traffic_percentage/:id', to: 'api/analytics#traffic_percentage'
  get '/api/overview', to: 'api/analytics#overview'
end
