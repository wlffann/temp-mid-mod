Rails.application.routes.draw do
  root to: "links#index"

  resources :links, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:index, :create]
    end
  end
end
