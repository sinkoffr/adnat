class ShiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_organisation, only: [:index, :create]

  def index
    @shifts = @current_organisation.shifts
  end

  def update

  end

  def new
    @shift = Shift.new
  end

  def create
    @current_organisation.shifts.create(shift_params)
    redirect_to root_path
  end

  private
  def shift_params
    params.require(:shift).permit(:start, :finish, :break_length, :organisation_enrollment_id)
  end

  def current_organisation
    @current_organisation ||= Organisation.find(params[:organisation_id])
  end

end
