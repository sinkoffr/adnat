class OrganisationsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @organisations = Organisation.all
    @organisation = Organisation.new
  end

  def new

  end

  def create
    @organisation = current_user.organisations.create(organisation_params)
  end

  private
  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end

end
