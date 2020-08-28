class ReservationsController < ApplicationController
  before_action :authenticate_customer

  def create
    @reservation = current_customer
                    .reservations
                    .build(reservation_params)
    if @reservation.save
      flash[:success] = '面談を予約しました'
      redirect_to customers_mypage_path
    else
      flash[:danger] = @reservation.errors.full_messages.join(',')
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    @reservation = current_customer.reservations.find(params[:id])
    @reservation.destroy!
    flash[:success] = '予約中の面談を削除しました'
    redirect_back fallback_location: customers_mypage_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservable_table_id)
  end
end
