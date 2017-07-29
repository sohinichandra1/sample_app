class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
    @friends = @user.friends
  end

  def add_location
    @user = User.find params[:id]
  end
end
