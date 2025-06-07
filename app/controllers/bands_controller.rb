class BandsController < ApplicationController
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
    @chat = Chat.new
  end

end
