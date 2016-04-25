Rails.application.routes.draw do

  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]

  # ideas
  resources :ideas do
    resources :likes, only: [:create, :destroy]
    resources :joins, only: [:create, :destroy]
  end

  # joins
  # This is to have a page showing joined users
  resources :joins, only: [:index]

  # users
  resources :users, only: [:create, :new]

  # sessions
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  root "ideas#index"

end
