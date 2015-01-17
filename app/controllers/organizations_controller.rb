class OrganizationsController < ApplicationController

  before_filter :authenticate_user!, :except => [:show]

  def new
    render "form"
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.user_id = current_user.id
    if @organization.save
      redirect_to @organization, notice: "D.O.C Successfully Added!"
    else
      flash[:message] = "Something did not validate."
      render "form"
    end
  end

  def show
    @organization = Organization.find(params[:id])
    if current_user
      @rating = current_user.ratings(params[:id])
    end
  end

  def edit
    @organization = Organization.find(params[:id])
    render "form"
  end

  private
  def organization_params
    params.require(:organization)
    .permit(:name,
            :address_line1,
            :address_line2,
            :postal_code,
            :city,
            :province,
            :phone,
            :user_id,
            :image)
  end 

end
