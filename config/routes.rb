Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/courses', to: 'courses#index'
      get '/courses/:course_id/enrollments', to: 'enrollments#index'
    end
  end

  
  get    "sessions/new"
  get    "login",  to: "sessions#new"
  post   "login",  to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :students
  resources :mentors
  resources :enrollments
  resources :mentor_enrollment_assignments
  resources :lessons

  resources :courses, only: [:new, :create, :show] do
    resources :submissions, only: [:new, :create]
  end

  resources :coding_classes
  resources :trimesters, only: [:edit, :update]

  get "/dashboard", to: "admin_dashboard#index", as: :dashboard

  get "up" => "rails/health#show", as: :rails_health_check
  root "home#index"
end

  
