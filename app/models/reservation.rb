class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :reservable_table
end
