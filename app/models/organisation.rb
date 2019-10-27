class Organisation < ApplicationRecord
  has_many :shifts
  has_many :organisation_enrollments
  
end
