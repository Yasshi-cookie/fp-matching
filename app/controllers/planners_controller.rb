class PlannersController < ApplicationController
  def new
    @planner = Planner.new
  end

  def create
    @planner = Planner.new(planner_params)
    if @planner.save
      log_in @planner
      flash[:success] = '登録完了しました！'
      redirect_to root_path
    else
      flash.now[:danger] = @planner.errors.full_messages.join('。')
      render 'new'
    end
  end

  private

  def planner_params
    params.require(:planner).permit(:name, :email, :password, :password_confirmation)
  end
end
