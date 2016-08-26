Rails.application.routes.draw do
  get "pages/index"
  devise_for :users, module: "users", :skip => [:registrations, :passwords]

  root to: 'welcome#index'

  resources :photos, only: [:create, :update, :destroy]

  resources :projects, except: [:show]
  get "/photos/:photo_id" => "projects#show"
  get "/projects/:url_key" => "projects#show"

  resources :pages

  resources :previews, only: [:create]

  resources :users, only: [:edit, :update]
  resources :meta_property_lists, only: [:new, :create, :edit, :update]

  resources :order_swaps, only: [:new, :create]

  get "/:url_key" => "welcome#show"

  get "projects/crop/:id" => 'projects#crop'
  get "crop/:id" => 'photos#crop'

  resources :teams, only: [:new, :create]
end
