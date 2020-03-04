Rails.application.routes.draw do

  get 'registrations/create'


  devise_for :users #, :controllers => {:registrations => "registrations"}

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :testers
  resources :startups do
    resources :versions do
      resources :feedbacks
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :questions, only: [:create]
    end
  end


  # routes for testing / feedback

  get "/dashboard", to: "dashboards#show"
end


