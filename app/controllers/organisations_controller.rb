class OrganisationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @organisations = Organisation.all
    @organisation = Organisation.new
  end

  def show
    @organisation = Organisation.find(params[:id])
  end
  def new

  end

  def create
    @organisation = Organisation.create(organisation_params)
  end

  def edit
    @organisation = Organisation.find(params[:id])
  end

  def update
    @organisation = Organisation.find(params[:id])

    if current_user.present
      @organisation.update(organisation_params)
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
    @current_organisation ||= Organisation.find(params[:id])
  end

end
