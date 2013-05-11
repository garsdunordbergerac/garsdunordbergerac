GarsDuNordBergerac::Application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :about_us_photos, only: :index
  resources :albums,          only: :show
  resources :events,          only: :index
  resources :messages,        only: :create
  resources :summaries,       only: :index

  root to: 'welcome#index'
end
