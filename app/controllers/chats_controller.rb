class ChatsController < ApplicationController
  def show
    @chat = Chat.find(chat_params[:id])
    @message = Message.new
  end

  def new
    @chat = Chat.new
  end

  def create
    @band = Band.find(params[:band_id])
    @chat = Chat.new(chat_params)
    @chat.band = @band
    @chat.user = current_user

    if @chat.save
      redirect_to band_chat_path(@band, @chat), notice: 'Chat was successfully created.'
    else
      redirect_to band_path(@band), alert: 'Failed to create chat.'
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:band_id, :user_id)
  end

end
