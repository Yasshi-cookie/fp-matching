# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  root 'home_pages#home'
  get 'home_pages/home'
  resources :customers, only: %i[new create]
end
