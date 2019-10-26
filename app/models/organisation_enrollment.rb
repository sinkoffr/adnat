class OrganisationEnrollment < ApplicationRecord
  belongs_to :organisation
  has_many :shifts
  belongs_to :user

end
