class Shift < ApplicationRecord
  belongs_to :organisation
  has_one :organisation_enrollment, :through => :organisation
  belongs_to :user
  validates :user_id, presence: true

  'require date'

  def hours_worked
    if self.break_length
      break_hours = self.break_length / 60
    else
      break_hours = 0
    end
      shift_length = self.shift_length
      return (shift_length - break_hours).to_f
  end

  def shift_length
    finish_hour = DateTime.parse(self.finish.to_s).hour
    finish_minutes = DateTime.parse(self.finish.to_s).min
    finish_seconds = DateTime.parse(self.finish.to_s).sec
    finish = (finish_seconds + (finish_minutes * 60) + (finish_hour * 3600)).to_f

    start_hour = DateTime.parse(self.start.to_s).hour
    start_minutes = DateTime.parse(self.start.to_s).min
    start_seconds = DateTime.parse(self.start.to_s).sec
    start = (start_seconds + (start_minutes * 60) + (start_hour * 3600)).to_f

    total_length = (finish - start) / 3600
    return total_length.round(2)
  end

  def cost
    pay_rate = self.organisation.hourly_rate
    return pay_rate * self.hours_worked
  end
end
