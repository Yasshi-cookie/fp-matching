# frozen_string_literal: true

class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      log_in @customer

      flash[:success] = '登録完了しました！'
      redirect_to customers_mypage_path
    else
      flash.now[:danger] = @customer.errors.full_messages.join(',')
      render 'new'
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :password, :password_confirmation)
  end
end
