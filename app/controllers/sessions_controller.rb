# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    customer = Customer.find_by(email: params[:session][:email].downcase)
    if customer&.authenticate(params[:session][:password])
      log_in customer
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy; end
end
