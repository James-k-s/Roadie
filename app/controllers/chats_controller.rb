class ChatsController < ApplicationController
  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
  end

  def create
    @band = Band.find(params[:band_id])
    @chat = Chat.new(chat_params)
    @chat.band = @band
    @chat.user = current_user

    if @chat.save
      redirect_to @chat, notice: 'Chat was successfully created.'
    else
      redirect_to band_path(@band), alert: 'Failed to create chat.'
    end
    @messages = Message.where(chat_id: @chat.id).order(created_at: :asc)
  end

  private

  def chat_params
    params.require(:chat).permit(:id, :band_id, :user_id)
  end
end
