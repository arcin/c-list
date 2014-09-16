Rails.application.routes.draw do
  root to: "users#index"
  get 'sign_up' => "users#new", as: "sign_up"
  get 'log_in' => "sessions#new", as: 'log_in'
  resources :sessions
  resources :users
end
