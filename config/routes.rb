Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :authors, except: [:show] do
    resources :books, except: [:show]
  end

  namespace :api do
    namespace :v1 do
      resources :authors, only: [:index, :create, :update, :destroy] do
        resources :books, only: [:create]
      end
    end
  end

  root "authors#index"
end
