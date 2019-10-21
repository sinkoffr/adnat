class OrganisationEnrollment < ApplicationRecord
  belongs_to :organisation
  belongs_to :user
  has_many :shifts

end
