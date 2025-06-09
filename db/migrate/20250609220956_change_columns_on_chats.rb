class ChangeColumnsOnChats < ActiveRecord::Migration[7.1]
  def change
    remove_column :chats, :user_id, foreign_key: true
    add_reference :chats, :user1, foreign_key: { to_table: :users }
    add_reference :chats, :user2, foreign_key: { to_table: :users }
  end
end
