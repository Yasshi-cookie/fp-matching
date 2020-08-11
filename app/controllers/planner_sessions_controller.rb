class PlannerSessionsController < ApplicationController
  def new; end

  def create
    planner = Planner.find_by(email: params[:session][:email].downcase)

    if planner&.authenticate(params[:session][:password])
      log_in planner
      redirect_to planners_mypage_path
    elsif !planner.nil?
      flash.now[:danger] = 'パスワードが間違っています'
      render 'new'
    else
      flash.now[:danger] = 'メールアドレスが間違っています'
      render 'new'
    end
  end

  def destroy
    planner_log_out if planner_logged_in?
    redirect_to root_url
  end
end
