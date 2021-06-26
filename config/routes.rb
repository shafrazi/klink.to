Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: :registrations, sessions: :sessions }
  get 'pages/index'

  namespace :api do
    resources :product_pages, param: :slug
    resources :link_items
  end

  root to: 'pages#index'

  post '/api/scrape', to: 'api/scrapes#scrape'

  get '/api/traffic_percentage/:id', to: 'api/analytics#traffic_percentage'
  get '/api/all_page_traffic', to: 'api/analytics#all_page_traffic'
end
