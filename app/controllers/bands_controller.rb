class BandsController < ApplicationController
  before_action :set_user, only: [:new, :create]
  def index
    @bands = Band.all
    @markers = @bands.geocoded.map do |band|
      {
        lat: band.latitude,
        lng: band.longitude
      }
    end
  end

  def show
    @band = Band.find(params[:id])
    @application = Application.new
    @vacancy = Vacancy.new
  end

  def new
    @user = current_user
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    @band.user = @user
    if @band.save
      redirect_to band_path(@band), notice: 'Band was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def band_params
    params.require(:band).permit(:name, :address, :bio, :genre, :photo)
  end
end
