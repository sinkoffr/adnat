class Shift < ApplicationRecord
  has_one :organisation

  def hours_worked

  end

  def shift_length
    start = Time.new(self.start)
    finish = Time.new(self.finish)
    return finish - start
  end
end
