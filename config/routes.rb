Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resource :users, only: [:create]
    post "/login", to: "users#login"
    get "/auto_login", to: "users#auto_login"
    namespace :v1 do
      resources :projects do
        resources :issues, :sprints
      end
    end
  end
end
