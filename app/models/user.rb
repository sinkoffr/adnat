class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :organisation_enrollments
  # has_many :joined_organisations, through: :organisation_enrollments, source: :organisation

  def joined_organisation?(organisation)
    joined_organisations = organisation_enrollments.collect(&:organisation)
    return joined_organisations.include?(organisation)
  end
end
