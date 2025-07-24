class UsersController < ApplicationController
  def index
    @users = User.all
    @users = @users.joins(:instruments).where("instruments.name ILIKE ?", "%#{params[:instrument]}%") if params[:instrument].present?
    @users = @users.where("address ILIKE ?", "%#{params[:location]}%") if params[:location].present?

    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "users/user_info_window", locals: { user: user }),
        marker_html: render_to_string(partial: "shared/marker")
      }
    end
  end

  def show
    @song = Song.new
    @user = User.find(params[:id])
    @chat = Chat.find_by(user1: @users, user2: current_user) ||
            Chat.find_by(user1: current_user, user2: @users) ||
            Chat.create(user1: current_user, user2: @users)
    @event = Event.new
    @user_band = @user.bands.first
    if @user_band
      @events = Event.where(user1_id: @user.id).or(Event.where(user2_id: @user.id)).or(Event.where(band_id: @user_band.id))
    else
      @events = Event.where(user1_id: @user.id).or(Event.where(user2_id: @user.id))
    end
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
