class UsersController < ApplicationController
  def index
    @user = User.all
    @users = User.all
    @markers = @user.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "users/user_info_window", locals: { user: user })
      }
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
