# frozen_string_literal: true

class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:success] = '登録完了しました！'
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :password,
                                     :password_confirmation)
  end
end
