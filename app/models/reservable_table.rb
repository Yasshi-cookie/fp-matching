class ReservableTable < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :time_table
  belongs_to :planner
  has_one :reservation, dependent: :destroy

  validates :date, presence: true
  validates :time_table_id, presence: true, uniqueness: { scope: %i[date planner_id] }
  validate :validate_that_time_table_is_available
  validate :validate_that_reservable_date_is_before_today

  before_destroy :prevent_destroy
  private

  def validate_that_time_table_is_available
    return if date.nil? || time_table.nil?

    errors.add(:time_table, 'は営業時間外です') unless time_table.available?(date)
  end

  def validate_that_reservable_date_is_before_today
    errors.add(:date, ': 過去の日付は使用できません') if date.present? && date < Date.today
  end

  def prevent_destroy
    if reservation
      errors.add(:base, '予約があるため削除できません')
      throw(:abort)
    end
  end
end
