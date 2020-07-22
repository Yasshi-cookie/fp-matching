# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    customer = Customer.find_by(email: params[:session][:email].downcase)

    if customer&.authenticate(params[:session][:password])
      log_in customer
      redirect_to root_path
    elsif !!customer
      flash.now[:danger] = 'パスワードが間違っています'
      render 'new'
    else
      flash.now[:danger] = 'メールアドレスが間違っています'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
