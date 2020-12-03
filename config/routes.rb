Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/registration', to: 'registrations#create'
      post '/login', to: 'sessions#create'
      resources :users
    end
  end
end
