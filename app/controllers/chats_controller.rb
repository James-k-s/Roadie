class ChatsController < ApplicationController
  def index
    @chats = Chat.where(user1_id: current_user.id).or(Chat.where(user2_id: current_user.id)).order(updated_at: :desc)
    @messages = Message.where(chat_id: @chats.pluck(:id)).order(created_at: :asc)
  end

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
  end

  def create
    @band = Band.find(params[:band_id])
    @user2 = User.find(params[:user_id])

    if current_user == @user2
      redirect_to band_path(@band), alert: "You cannot chat with yourself."
      return
    end

    @chat = Chat.find_by(user1: current_user, user2: @user2) ||
            Chat.find_by(user1: @user2, user2: current_user) ||
            Chat.create(user1: current_user, user2: @user2, band: @band)

    if @chat.persisted?
      redirect_to @chat, notice: 'Chat was successfully created.'
    else
      redirect_to band_path(@band), alert: 'Failed to create chat.'
    end
    @messages = Message.where(chat_id: @chat.id).order(created_at: :asc)
  end

  private

  def chat_params
    params.require(:chat).permit(:band_id, :user1_id, :user2_id)
  end
end
