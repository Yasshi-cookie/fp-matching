# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home_pages#home'

  get 'sessions/new'
  get 'home_pages/home'
  delete '/logout', to: 'sessions#destroy'
  delete 'planner/logout', to: 'planner_sessions#destroy'
  resources :customers, only: %i[new create]
  resources :sessions, only: %i[new create]
  resources :planners, only: %i[new create]
  resources :planner_sessions, only: %i[new create]
end
