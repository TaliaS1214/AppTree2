Rails.application.routes.draw do

  root 'welcome#index'

  # Apps
  resources :apps, only: [:index, :create, :show, :update]

  # Genres
  resources :apps
  # Users

  # Searches
  resources :searches, only: [:create]

end
