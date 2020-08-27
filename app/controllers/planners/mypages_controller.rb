module Planners
  class MypagesController < ApplicationController
    before_action :authenticate_planner

    def show
      @reservable_tables = current_planner
                            .reservable_tables.joins(:reservation).where('date >= ?', Date.current).order(date: :asc)
    end
  end
end
