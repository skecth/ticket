Rails.application.routes.draw do
  devise_for :organizers
  resources :tickets
  resources :events
  resources :order_tickets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resource :carts, only: [:show]
  get 'org_profile', to:'organizers#show'
  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
  get "/my_events", to: "events#organizer_events"
end
