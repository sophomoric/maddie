Rails.application.routes.draw do
  get "pages/index"
  devise_for :users, :skip => [:registrations, :passwords]

  root to: 'welcome#index'

  resources :photos, only: [:create, :update, :destroy]

  resources :projects, except: [:show]
  get "/photos/:photo_id" => "projects#show"
  get "/projects/:url_key" => "projects#show"

  resources :pages, only: [:index, :create, :update, :destroy]

  get "/:url_key" => "welcome#show"

  get "projects/crop/:id" => 'projects#crop'
  get "crop/:id" => 'photos#crop'
end
