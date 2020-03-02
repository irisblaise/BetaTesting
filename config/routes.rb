Rails.application.routes.draw do
  get 'testers/index'
  get 'testers/show'
  get 'testers/edit'
  get 'testers/update'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :testers
  # update "/testers/:id", to:"testers#update", as: :update_tester
  resources :startup


  resources :feedback do
    resources :questions do
      resources :answers
    end
  end

 # routes for testing / feedback


  get "/dashboard/tester", to: "dashboards#tester"
  get "/dashboard/startup", to: "dashboards#startup"
end


