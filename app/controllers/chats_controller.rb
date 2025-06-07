class ChatsController < ApplicationController
  def show
    @chat = Chat.find_by(user_id: current_user.id)
    @message = Message.new
  end

  def create
    @band = Band.find(params[:band_id])
    @chat = Chat.new(band: @band, user: current_user)

    if @chat.save
      redirect_to band_chat_path(@band, @chat), notice: 'Chat was successfully created.'
    else
      redirect_to band_path(@band), alert: 'Failed to create chat.'
    end
  end
end
