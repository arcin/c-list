Rails.application.routes.draw do
  root to: "users#index"
  get 'sign_up' => "users#new", as: "sign_up"
  resources :users
end
