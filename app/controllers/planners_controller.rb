class PlannersController < ApplicationController
  def new
    @planner = Planner.new
  end

  def create
    @planner = Planner.new(planner_params)
    if @planner.save
      planner_log_in @planner
      flash[:success] = '登録完了しました！'
      redirect_to root_path
    else
      flash.now[:danger] = @planner.errors.full_messages.join('。')
      render 'new'
    end
  end

  def show
    @planner = Planner.find(params[:id])
    @reservable_tables = @planner.reservable_tables.where('date >= ?', Date.current)
  end

  def index
    @planners = Planner.all
  end

  private

  def planner_params
    params.require(:planner).permit(:name, :email, :password, :password_confirmation)
  end
end
