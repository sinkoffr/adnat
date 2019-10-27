class Organisation < ApplicationRecord
  has_many :organisation_enrollments
  has_many :shifts
  has_many :users, :through => :organisation_enrollments

end
