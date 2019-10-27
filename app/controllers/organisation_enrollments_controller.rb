class OrganisationEnrollmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_organisation

  def create
    @enrollments = OrganisationEnrollment.create(
      user_id: current_user.id,
      organisation_id: @current_organisation.id
    )
    redirect_to organisation_path(current_organisation)
  end

  def destroy
    @organisation_enrollment = OrganisationEnrollment.find(params[:id])
    @organisation_enrollment.organisation.shifts.destroy_all
    @organisation_enrollment.destroy
    redirect_to root_path
  end

  private

  def current_organisation
    @current_organisation ||= Organisation.find(params[:organisation_id])
  end

  def enrollment_params
    params.require(:organisation_enrollment).permit(:user_id, :organisation_id)
  end
end
