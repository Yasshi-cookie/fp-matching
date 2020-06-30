# frozen_string_literal: true

class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    redirect_to root_path if @customer.save
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :password,
                                     :password_confirmation)
  end
end
