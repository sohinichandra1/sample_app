class UsersController < ApplicationController
  before_filter :authenticate_user!, except: :public_profile

  def index
    @users = User.all
  end

  def show
    @user = User.includes(:friends, user_shared_places: [:shared_place, :friend]).find params[:id]
    @friends = @user.friends
    @shared_places_data = (@user.user_shared_places + @user.places_shared_with_user).to_json(only: [:public, :friend_id], methods: [:latitude, :longitude, :address])
  end

  def public_profile
    @user = User.where(username: params[:id]).first
    @public_places = @user.public_shared_places.to_json(only: [:latitude, :longitude, :address])
    #binding.pry
  end
end
