Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :authors do
    resources :books
  end

  root "authors#index"
end
