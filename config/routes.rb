Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/registration', to: 'registrations#create'
      post '/login', to: 'sessions#login'
      resources :users
      resources :projects
    end
  end
end
