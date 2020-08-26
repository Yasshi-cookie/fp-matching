module PlannerSessionsHelper
  def planner_log_in(planner)
    session[:planner_id] = planner.id
  end

  def current_planner
    @current_planner ||= Planner.find_by(id: session[:planner_id]) if session[:planner_id]
  end

  def planner_logged_in?
    !current_planner.nil?
  end

  def planner_log_out
    session.delete(:planner_id)
    @current_planner = nil
  end
end
