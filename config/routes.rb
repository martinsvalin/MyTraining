Mytraining::Application.routes.draw do
  match '/auth/google_apps/callback' => "sessions#create"

  resources :workouts, :except => [:update]

  resources :trainings

  resources :people

  root :to => "trainings#index"
end
