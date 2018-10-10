Rails.application.routes.draw do
  get 'home' => 'home#index'
  get 'jobs' => 'jobs#index'
  root 'landing#index'

  resources :passwords, controller: "passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]
  resources :users, controller: "users", only: [:update, :create, :show] do
    get "/education" => 'users#education'
    get "/experiences" => 'users#experiences'
    get "/about_me" => 'users#about_me'
    get "/edit_name" => 'users#edit_name'
    get "/edit_detail" => 'users#edit_detail'
    get "/edit_email" => 'users#edit_email'
    get "/edit_phone" => 'users#edit_phone'
    
    resource :password,
      controller: "passwords",
      only: [:create, :edit, :update]
  end
  get "users/home"
  # get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
end
