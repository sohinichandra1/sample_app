class PlacesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @place = current_user.shared_places.build
  end

  def create
    @place = current_user.shared_places.build(place_params)

    if params[:share_via] == "friend" && params[:friend_ids].blank?
      flash.now[:warning] = "Please select friends"
      render :new and return
    end

    if @place.valid?
      @place.build_share_locations(params, current_user)
      @place.save
      flash[:success] = "Location added successfully"
      redirect_to user_path(current_user)
    else
      flash.now[:warning] = @place.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def place_params
    params.require(:shared_place).permit(:street_address, :zip_code, :state, :country)
  end
end
