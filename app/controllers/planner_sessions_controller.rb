class PlannerSessionsController < ApplicationController
  def new; end

  def create
    planner = Planner.find_by(email: params[:session][:email].downcase)
    if planner&.authenticate(params[:session][:password])
      log_in planner
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy; end
end
