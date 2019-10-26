class OrganisationEnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @enrollments = current_user.organisation_enrollments.create(enrollment_params)
    redirect_to organisation_path(current_organisation)
  end

  def destroy
    @organisation_enrollment = OrganisationEnrollment.find(params[:id])
    user = current_user.id

# Delete shifts for this organisation AND user
    @organisation_enrollment.user.shifts.destroy_all
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
