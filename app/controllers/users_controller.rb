class UsersController < ApplicationController
  def index
    @user = User.all
    @users = User.all
    @markers = @user.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
