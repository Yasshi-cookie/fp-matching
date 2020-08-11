class PlannerSessionsController < ApplicationController
  def new; end

  def create
    planner = Planner.find_by(email: params[:session][:email].downcase)

    if planner&.authenticate(params[:session][:password])
      log_in planner
      flash[:success] = 'ログイン成功しました'
      redirect_to planners_mypage_path
    else
      flash.now[:danger] = 'メールアドレスかパスワードが間違っています'
      render 'new'
    end
  end

  def destroy
    planner_log_out if planner_logged_in?
    redirect_to root_url
  end
end
