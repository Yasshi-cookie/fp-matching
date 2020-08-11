# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PlannerSessions', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/planner_sessions/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/planner_sessions/create'
      expect(response).to have_http_status(:success)
    end
  end
end
