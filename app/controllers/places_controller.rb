class PlacesController < ApplicationController
  before_filter :find_user

  def new
    @place = @user.places.new
  end

  def create
    if @user.places.create(place_params)
      flash[:success] = "Location added successfully"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def find_user
    @user = User.find params[:user_id]
  end

  def place_params
    params.require(:place).permit(:street_address, :zip_code, :state, :country)
  end
end
