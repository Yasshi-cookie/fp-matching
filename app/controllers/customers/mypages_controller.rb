module Customers
  class MypagesController < ApplicationController
    before_action :authenticate_customer

    def show
      @reservable_tables = current_customer
                            .reservable_tables.eager_load(:reservation).where('date >= ?', Date.current).order(date: :asc)
    end
  end
end
