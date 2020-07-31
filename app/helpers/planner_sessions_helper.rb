module PlannerSessionsHelper
  def log_in(planner)
    session[:planner_id] = planner.id
  end

  def current_planner
    @current_planner ||= Planner.find_by(id: session[:planner_id]) if session[:planner_id]
  end

  def logged_in?
    !current_planner.nil?
  end
end
