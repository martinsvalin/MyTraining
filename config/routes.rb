Mytraining::Application.routes.draw do
  match '/auth/google_apps/callback' => "sessions#create"

  resources :workouts, :except => [:update]

  resources :trainings, :except => [:show]

  resources :people

  root :to => "trainings#index"
end
