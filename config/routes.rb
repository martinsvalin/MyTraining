Mytraining::Application.routes.draw do
  match '/auth/google_apps/callback' => "sessions#create"

  resources :workouts, :only => [:create, :destroy]

  resources :trainings, :except => [:show]

  resources :people

  root :to => "trainings#index"
end
