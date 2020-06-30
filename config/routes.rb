# frozen_string_literal: true

Rails.application.routes.draw do
  resources :customers, only: %i[new create]
end
