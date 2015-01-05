Rails.application.routes.draw do

  root 'welcome#index'

  # Users
  resources :users, only: [:create, :show, :update]

  # User Auth
  resource :session, only: [:create, :show, :destroy]

  # Apps
  resources :apps, only: [:index, :create, :show, :update]

  # Genres
  resources :genres, only: [:index, :create, :show, :update]

  # Users

  # Searches
  get '/search'     => 'searches#create'

end
