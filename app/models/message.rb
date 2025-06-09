class Message < ApplicationRecord
  after_create_commit :broadcast_message
  belongs_to :user
  belongs_to :chat

  private

  def broadcast_message
    broadcast_append_to "chat_#{chat.id}_messages",
                        partial: "messages/message",
                        locals: { message: self, user: user },
                        target: "messages"
  end
end
