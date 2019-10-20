class OrganisationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @organisations = Organisation.all
    @organisation = Organisation.new
  end

  def new

  end

  def create
    @organisation = current_user.organisations.create(organisation_params)
  end

  def edit
    @organisation = Organisation.find(params[:id])
  end

  def update
    @organisation = Organisation.find(params[:id])
    @organisation.update(organisation_params)
    redirect_to root_path
  end

  private
  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end

end
