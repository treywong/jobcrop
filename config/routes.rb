Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  # homepage
  get "users/home"
  root "users#home"

  # userprofile route
  get "users/profile"

  resources :users, only: [:profile] do
  	resources :educations
    resources :experiences
    resources :skills
    resources :projects
  end

  # videochat
  get "chats/videochat"
  post "sessions", to: 'sessions#create'
  mount ActionCable.server, at: '/cable'

  # messagechatting
  resources :personal_messages
  resources :conversations, only: [:index, :show]
  resources :users, only: [:index]
  
  post "/personal_messages/:receiver_id/new" => "personal_messages#create", as: "sending_message"

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 	
end
