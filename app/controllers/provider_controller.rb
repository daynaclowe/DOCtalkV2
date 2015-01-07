class ProviderController < ApplicationController
  def index
    @providers = Provider.all
  end

  def new
    #binding.pry
    render "form"
  end

  def edit
    @provider = Provider.find(params[:id])
    render "form"
  end

end
