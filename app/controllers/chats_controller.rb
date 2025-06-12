class ChatsController < ApplicationController
  def index
    @user = current_user
    @chats = Chat.where(user1_id: @user.id).or(Chat.where(user2_id: @user.id)).order(updated_at: :desc)
    @messages = Message.where(chat_id: @chats.pluck(:id)).order(created_at: :asc)
  end

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
  end

  def create
    @band = Band.find(params[:band_id])
    @chat = Chat.new(chat_params)
    @user2 = User.find(params[:user_id])
    @chat.band = @band
    @chat.user = current_user
    @chat.user2 = @user2

    if @chat.save
      redirect_to @chat, notice: 'Chat was successfully created.'
    else
      redirect_to band_path(@band), alert: 'Failed to create chat.'
    end
    @messages = Message.where(chat_id: @chat.id).order(created_at: :asc)
  end

  private

  def chat_params
    params.require(:chat).permit(:id, :band_id, :user1_id, :user2_id)
  end
end
