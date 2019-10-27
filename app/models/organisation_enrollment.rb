class OrganisationEnrollment < ApplicationRecord
  belongs_to :organisation
  has_many :shifts, through: :organisations
  belongs_to :user

end
