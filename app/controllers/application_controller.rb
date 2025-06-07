class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_user_band

  private

  def set_user_band
    if user_signed_in?
      band_member = BandMember.find_by(user_id: current_user.id)
      @user_band = Band.find_by(id: band_member.band_id) if band_member
    else
      @user_band = nil
    end
  end
end
