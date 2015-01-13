class RatingsController < ApplicationController
before_filter :load_provider
before_filter :authenticate_user!, :except => [:show]
before_filter :load_rating, only:[:show, :destroy, :edit, :update]

  def show
  end

  def new
    @rating = Rating.new
  end

  def create
    @rating = @provider.ratings.build(rating_params)
      if current_user
        @rating.user = current_user
      end

      if @rating.save
        redirect_to @provider, notice: 'Rating successfully created'
      else
        render 'providers/show'
      end
  end

  def edit 
    @rating = Rating.find(params[:id])
  end

  def update
    if @rating.update(rating_params)
      redirect_to @provider
    else
      render :edit
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:knowledge, :support, :comfort, :accessibility, :reccomendation, :provider_id, :user_id, :kind)
  end

  def load_provider
    provider = params[:provider_id]
    @provider = Provider.find(provider)
  end

  def load_rating
    @rating = Rating.find(params[:id])
  end

end
