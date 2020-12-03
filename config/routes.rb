Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/registration', to: 'registration#create'
      resources :users
    end
  end
end
