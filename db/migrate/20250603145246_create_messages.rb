class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :message_content
      t.references :user, null: false, foreign_key: true
      t.references :chats, null: false, foreign_key: true

      t.timestamps
    end
  end
end
