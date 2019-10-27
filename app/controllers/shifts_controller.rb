class ShiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_organisation, only: [:index, :create, :update, :destroy]
  before_action :current_shift, only: [:edit, :update, :destroy]


  def index
    @shifts = @current_organisation.shifts
  end

  def edit
    @shift = @current_shift
  end

  def update
    @shift = @current_shift
    @shift.update(shift_params)
    redirect_to organisation_shifts_path(@current_organisation)
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = current_user.shifts.create(shift_params.merge(organisation: @current_organisation))
    if @shift.valid?
      redirect_to organisation_shifts_path(@current_organisation)
    else
      render :create, status: :unprocessable_entity
    end
  end

  def destroy
    @shift = @current_shift
    @shift.destroy
    redirect_to organisation_shifts_path(@current_organisation)
  end

  private
  def shift_params
    params.require(:shift).permit(:start, :finish, :break_length, :organisation_id, :user_id)
  end

  def current_organisation
    @current_organisation ||= Organisation.find(params[:organisation_id])
  end

  def current_shift
    @current_shift = Shift.find(params[:id])
  end

end
