Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/registration', to: 'registrations#create'
      post '/login', to: 'sessions#login'
      resources :projects do
        resources :tasks do
          resources :comments, only: %i[show create destroy]
        end
      end
    end
  end
end
