Rails.application.routes.draw do
  get 'dashboards/startup'
  get 'dashboards/tester'
  get 'registrations/create'
  get 'testers/index'
  get 'testers/show'
  get 'testers/edit'
  get 'testers/update'

  devise_for :users, :controllers => {:registrations => "registrations"}

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :testers
  resources :startups

  resources :versions do
    resources :feedbacks
  end

  # routes for testing / feedback

  get "/dashboard", to: "dashboards#show"
end


