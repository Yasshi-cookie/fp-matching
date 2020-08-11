# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Planners', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/planners/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/planners/create'
      expect(response).to have_http_status(:success)
    end
  end
end
