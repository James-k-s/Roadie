class BandsController < ApplicationController
  def index
    @bands = Band.all
    @markers = @bands.geocoded.map do |band|
      {
        lat: band.latitude,
        lng: band.longitude,
        info_window_html: render_to_string(partial: "bands/band_info_window", locals: { band: band })
      }
    end
  end

  def show
    @albums = Album.all
    @album = Album.new
    @song = Song.new
    @band = Band.find(params[:id])
    @is_member = @band.member?(current_user)
    @application = Application.new
    @vacancy = Vacancy.new
    if Chat.find_by(band: @band, user1: current_user)
      @chat = Chat.find_by(band: @band, user1: current_user)
    else
      @chat = Chat.new(band: @band, user1: current_user)
      @chat.save
    end
    @chats = @band.chats.where(user1: current_user)
    @event = Event.new
    if @band.band_members.exists?(user: current_user)
      @events = @band.events
    else
      @events = @band.events.where(status: "gig").or(@band.events.where(status: "tour"))
    end
  end

  def new
    @user = current_user
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    @band.user = current_user
    if @band.save
      redirect_to band_path(@band), notice: 'Band was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def band_params
    params.require(:band).permit(:name, :address, :bio, :genre, :photo)
  end
end
