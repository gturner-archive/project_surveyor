Rails.application.routes.draw do

  root to: "surveys#index"

  resources :users, except: [:update, :edit, :destroy]
  resources :surveys do
    resources :number_range_questions
    resources :multiple_choice_questions
  end


end
