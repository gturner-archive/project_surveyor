Rails.application.routes.draw do

  root to: "surveys#index"

  resources :users, except: [:update, :edit, :destroy]
  resources :surveys

end
