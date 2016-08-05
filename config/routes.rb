Rails.application.routes.draw do

  root to: "surveys#index"

  resources :users, except: [:update, :edit, :destroy]
  resources :surveys do
    resources :number_range_questions, only: [:new, :create, :destroy]
    resources :multiple_choice_questions, only: [:new, :create, :destroy]
  end

  resources :multiple_choice_questions, only: [] do
    resources :options, only: [:new, :create]
  end


end
