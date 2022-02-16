Rails.application.routes.draw do
  devise_for :users

  root to: "events#index"
  resources :events, only: [:index, :show, :new, :create]
  resources :users, only: [:index, :show]
  resources :event_attendees, only: :create
end
