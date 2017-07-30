class PlacesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_user

  def new
    @place = @user.shared_places.build
  end

  def create
    @place = @user.shared_places.build(place_params)

    if @place.valid?
      @place.build_share_locations(params, @user)
      @place.save
      flash[:success] = "Location added successfully"
      redirect_to user_path(@user)
    else
      flash.now[:warning] = @place.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def find_user
    @user = User.find params[:user_id]
  end

  def place_params
    params.require(:shared_place).permit(:street_address, :zip_code, :state, :country)
  end
end
