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
    if Chat.find_by(user1: @user, user2: current_user)
      @chat = Chat.find_by(user1: @user, user2: current_user)
    elsif Chat.find_by(user1: current_user, user2: @user)
      @chat = Chat.find_by(user1: current_user, user2: @user)
    else
      @chat = Chat.new(user1: current_user, user2: @user)
      @chat.save
    end
    @event = Event.new
    @user_band = @user.bands.first
    @events = Event.where(user1_id: @user.id).or(Event.where(user2_id: @user.id)).or(Event.where(band_id: @user_band.id))
    if current_user != @user
      public_events = @events.select { |event| event.status == "gig" || event.status == "tour" }
      @events = public_events
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :adress, :bio, :photo, :genre, :latitude, :longitude)
  end
end
