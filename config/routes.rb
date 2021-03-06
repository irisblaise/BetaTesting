Rails.application.routes.draw do

  get 'reviews/index'
  get 'reviews/new'
  get 'reviews/create'
  devise_for :users# , :controllers => {:registrations => "registrations"}
  root to: 'pages#home'
  get "/dashboard", to: "dashboards#show"
  get "/about_us", to: 'pages#about_us'
  get "/help_and_support", to: 'pages#help_and_support'

  resources :testers

  resources :startups do
    resources :versions do
      resources :feedbacks
    end
  end



resources :feedbacks, only: [:show] do
    resources :reviews, only: [:new, :create, :index]
      end

  resources :orders, only: [:show, :index, :update]


  resources :feedbacks, only: [:show] do
    resources :reviews, only: [:new, :create, :index]
  end

  resources :answers

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :questions, only: [:create, :destroy]
      post "feedbacks/:id/review", to: "feedbacks#review"
    end
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'
  # routes for testing / feedback
end
