# frozen_string_literal: true

module ApplicationHelper
  def customer?(mode)
    mode == "customer"
  end

  def planner?(mode)
    mode == "planner"
  end
end
