Rails.application.routes.draw do

  get 'version/index'
  get 'version/create'
  get 'version/new'
  get 'version/edit'
  get 'version/show'
  get 'version/update'
  get 'version/destroy'
  get 'registrations/create'
  get 'testers/index'
  get 'testers/show'
  get 'testers/edit'
  get 'testers/update'

  devise_for :users #, :controllers => {:registrations => "registrations"}

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :testers
  resources :startups

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :questions, only: [:create, :destroy]
    end
  end

  resources :versions do
    resources :feedbacks
  end

  # routes for testing / feedback

  get "/dashboard", to: "dashboards#show"
end


