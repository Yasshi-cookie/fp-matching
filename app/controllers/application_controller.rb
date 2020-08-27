# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CustomerSessionsHelper
  include PlannerSessionsHelper

  private

  def authenticate_customer
    unless current_customer
      redirect_to new_session_path
    end
  end

  def authenticate_planner
    unless current_planner
      redirect_to new_planner_session_path
    end
  end

end
