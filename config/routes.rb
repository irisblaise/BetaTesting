Rails.application.routes.draw do

  get 'reviews/index'
  get 'reviews/new'
  get 'reviews/create'
  devise_for :users #, :controllers => {:registrations => "registrations"}
  root to: 'pages#home'
  get "/dashboard", to: "dashboards#show"

  resources :testers
  resources :startups do
    resources :versions do
      resources :feedbacks
    end
  end

  resources :feedbacks, only: [:show] do

    resources :reviews, only: [:new, :create, :index]
      end





  resources :answers

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :questions, only: [:create, :destroy]
    end
  end

  # routes for testing / feedback

end
