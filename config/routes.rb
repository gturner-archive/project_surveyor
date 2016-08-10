Rails.application.routes.draw do

  root to: "surveys#index"

  resources :users, except: [:update, :edit, :destroy] do
    resources :responses, only: [:create]
  end

  resources :surveys do
    resources :number_range_questions, only: [:new, :create]
    resources :multiple_choice_questions, only: [:new, :create]
  end

  resources :multiple_choice_questions, only: [:edit, :update, :destroy] do
    resources :options, only: [:new, :create]
  end

  resources :number_range_questions, only: [:destroy]

  namespace 'admin' do
    resources :surveys, only: [:show]
  end
end
