Rails.application.routes.draw do
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

  resources :feedbacks do
    resources :questions do
      resources :answers
    end
  end

 # routes for testing / feedback


  get "/dashboard/tester", to: "dashboards#tester"
  get "/dashboard/startup", to: "dashboards#startup"
end


