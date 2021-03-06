class TimeTable < ActiveHash::Base
  # has_many :reservable_tables, dependent: :destroy

  self.data = [
    { id: 1, start_time: '10:00', end_time: '10:30' },
    { id: 2, start_time: '10:30', end_time: '11:00' },
    { id: 3, start_time: '11:00', end_time: '11:30' },
    { id: 4, start_time: '11:30', end_time: '12:00' },
    { id: 5, start_time: '12:00', end_time: '12:30' },
    { id: 6, start_time: '12:30', end_time: '13:00' },
    { id: 7, start_time: '13:00', end_time: '13:30' },
    { id: 8, start_time: '13:30', end_time: '14:00' },
    { id: 9, start_time: '14:00', end_time: '14:30' },
    { id: 10, start_time: '14:30', end_time: '15:00' },
    { id: 11, start_time: '15:00', end_time: '15:30' },
    { id: 12, start_time: '15:30', end_time: '16:00' },
    { id: 13, start_time: '16:00', end_time: '16:30' },
    { id: 14, start_time: '16:30', end_time: '17:00' },
    { id: 15, start_time: '17:00', end_time: '17:30' },
    { id: 16, start_time: '17:30', end_time: '18:00' }
  ]

  def time_range_text
    "#{start_time} ~ #{end_time}"
  end

  def available?(date)
    return true if date.on_weekday?

    if date.saturday?
      # 11時〜15時
      id.between?(3, 10)
    else
      false
    end
  end
end
