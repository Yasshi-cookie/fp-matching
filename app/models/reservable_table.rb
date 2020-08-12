class ReservableTable < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :time_table
  belongs_to :planner
end
