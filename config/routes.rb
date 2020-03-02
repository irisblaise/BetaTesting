Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :user do
    resources :testers
    resources :startup
  end


  resources :feedback do
    resources :questions do
      resources :answers
    end
  end

 # routes for testing / feedback


  get "/dashboard/tester", to: "dashboards#tester"
  get "/dashboard/startup", to: "dashboards#startup"
end


