class OrganisationEnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.organisation_enrollments.create(organisation: current_organisation)
    redirect_to organisation_path(current_organisation)
  end

  private

  def current_organisation
    @current_organisation ||= Organisation.find(params[:organisation_id])
  end
end
