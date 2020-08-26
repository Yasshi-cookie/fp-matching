class ReservableTablesController < ApplicationController
  before_action :authenticate_planner

  def new
    @reservable_table = ReservableTable.new
    @reservable_tables = current_planner.reservable_tables.where('date >= ?', Date.current).order(date: :asc)
  end

  def create
    @reservable_table = current_planner
                          .reservable_tables
                          .build(reservable_table_params)
    if @reservable_table.save
      flash[:success] = '空き時間を登録しました'
      redirect_to planners_mypage_path
    else
      flash.now[:danger] = @reservable_table.errors.full_messages.join(',')
      render 'new'
    end
  end

  private

  def reservable_table_params
    params.require(:reservable_table).permit(:time_table_id, :date)
  end
end
