Rails.application.routes.draw do
  root to: "static_pages#root"

  resources :bookings, default: {format: :json}, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
