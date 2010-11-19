Mytraining::Application.routes.draw do
  match '/auth/google_apps/callback' => "sessions#create"

  resources :workouts

  resources :trainings

  resources :people

  root :to => "trainings#index"
end
