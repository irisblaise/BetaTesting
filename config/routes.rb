Rails.application.routes.draw do



  devise_for :users #, :controllers => {:registrations => "registrations"}
  root to: 'pages#home'
  get "/dashboard", to: "dashboards#show"


  resources :testers, only: [:new, :create, :edit, :update, :delete]
  resources :startups do
      resources :versions do
        resources :feedbacks
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :questions, only: [:create, :destroy]
    end
  end

  # routes for testing / feedback

end
