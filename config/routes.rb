Rails.application.routes.draw do
  get 'home' => 'home#index'
  get 'jobs' => 'jobs#index'
  root 'landing#index'

  resources :search, controller: 'search', only: [:create]
  post '/search/filter' => 'search#filter', as: 'search_filter'

  resources :passwords, controller: "passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]
  resources :users, controller: "users", only: [:update, :create, :show, :new] do
      resources :educations
      resources :experiences
      resources :skills
      resources :projects
    get "/about_me" => 'users#about_me'
    get "/edit_name" => 'users#edit_name'
    get "/edit_about_me" => 'users#edit_about_me'
    get "/edit_email" => 'users#edit_email'
    get "/edit_phone" => 'users#edit_phone'
    patch "/add_skill" => 'users#add_skill'
    delete "/remove_skill/:id" => 'users#remove_skill', as: 'remove_skill'

    resource :password,
      controller: "passwords",
      only: [:create, :edit, :update]

    resources :employer, controller: "employers", only: [:edit, :update, :create]
  end

  get "users/home"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"

  # For employer
  get "/employer/company/:id/company_page" => "employers#company_page", as: "company_page"
  get "/employer/company/:id/job_page" => "employer_jobs#index", as: "job_page"
  get "/employer/company/:id/timeline_page" => "employer_timelines#index", as: "timeline_page"
  get "/employer/company/:id/review_page" => "employers#review_page", as: "review_page"
  get "/employer/company/:id/analysis_page" => "employers#analysis_page", as: "analysis_page"
  get "/employer" => 'employers#index', as: 'employer_index'
  get "/employer/new" => 'employers#new', as: 'new_employer'
  delete "/employer_jobs/:id" => "employer_jobs#delete", as: "delete_employer_job"
  delete "/employer_timelines/:id" => "employer_timelines#delete", as: "delete_employer_timeline"


  post '/user-pre-employer' => 'users#create_pre_employer', as: 'create_pre_employer'
  resources :employer_jobs, controller: "employer_jobs"
  resources :employer_timelines, controller: "employer_timelines"
  resources :company, controller: "companies", only: [:new, :create]

end
