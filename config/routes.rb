Mytraining::Application.routes.draw do
  resources :workouts

  resources :trainings

  resources :people

  root :to => "trainings#index"
end
