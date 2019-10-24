class Shift < ApplicationRecord
  belongs_to :organisation_enrollments
  has_one :organisation

  def start_time
    
  end
end
