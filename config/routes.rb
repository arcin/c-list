Rails.application.routes.draw do
  root to: "categories#index"
  get 'sign_up' => "users#new", as: "sign_up"
  get 'log_in' => "sessions#new", as: 'log_in'
  get 'log_out' => "sessions#destroy", as: 'log_out'

  resources :categories, shallow: true do
    resources :posts
  end

  resources :users do
    member do
      get :posts
    end
  end

  resources :sessions
end
