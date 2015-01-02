Rails.application.routes.draw do

  root 'welcome#index'

  # Apps
  resources :apps, only: [:index, :create, :show, :update]

  # Genres
  resources :genres, only: [:index, :create, :show, :update]

  # Users

  # Searches
  get '/search'     => 'searches#create'

end
