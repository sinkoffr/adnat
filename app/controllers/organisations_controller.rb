class OrganisationsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_organisation, only: [:show, :edit, :update]

  def index
    @organisations = Organisation.all
    @organisation = Organisation.new
  end

  def show
    @current_organisation
  end

  def new
  end

  def create
    @organisation = Organisation.create(organisation_params)
    redirect_to root_path
  end

  def edit
    @organisation = @current_organisation
  end

  def update
    if current_user.present?
      @current_organisation.update(organisation_params)
      redirect_to root_path
    else
      @current_organisation.update(organisation_params)
      redirect_to user_path
    end

  end

  private
  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate, :user_id)
  end

  def current_organisation
    @current_organisation = Organisation.find(params[:id])
  end

end
