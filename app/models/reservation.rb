class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :reservable_table

  validates :customer_id, presence: true
  validates :reservable_table_id, presence: true, uniqueness: { scope: :customer_id }
end
