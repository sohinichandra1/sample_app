class PlacesController < ApplicationController
  before_filter :find_user

  def new
    @place = Place.new(user_id: @user.id)
  end

  def create
    place = Place.new(place_params.merge!(user_id: @user.id))

    if place.save
      if params[:share_via] == "all"
        @user.shared_places.create(place: place, public: true)
      elsif params[:share_via] == "friend"
        params[:friend_ids].each do |friend_id|
          @user.shared_places.create(place: place, friend_id: friend_id)
        end
      end

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
