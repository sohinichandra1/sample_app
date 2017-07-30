class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
    @friends = @user.friends
  end

  def get_friends
    @user = User.find params[:id]
    @user.friends
  end
end
