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
    band_member = BandMember.find_by(user_id: current_user.id)
    @user_band = band_member&.band
    @band = Band.find(params[:id])
    @application = Application.new
    @vacancy = Vacancy.new
  end
end
