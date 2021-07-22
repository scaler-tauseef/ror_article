Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :facts  
      resources :articles  
    end
  end
end