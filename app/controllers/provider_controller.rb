class ProviderController < ApplicationController
  def index
    @providers = Provider.all
  end

  def new
    @provider = Provider.find(params[:id])
    render "form"
  end

  def edit
    @provider = Provider.find(params[:id])
    render "form"
  end

end
