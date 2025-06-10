class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_user_band
  before_action :set_user_chats
  before_action :set_message
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :address, :bio, :photo, genre_ids: []])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :address, :bio, :photo, genre_ids: []])
  end


  private

  def set_user_band
    if user_signed_in?
      band_member = BandMember.find_by(user_id: current_user.id)
      @user_band = Band.find_by(id: band_member.band_id) if band_member
    else
      @user_band = nil
    end
  end

  def set_user_chats
    if user_signed_in?
      @user_chats = Chat.where(user_id: current_user.id)
    else
      @user_chats = []
    end
  end

  def set_message
    if user_signed_in?
      @message = Message.new
    else
      @message = nil
    end
  end
end
