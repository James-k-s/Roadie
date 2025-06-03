class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.boolean :status
      t.string :title
      t.string :type
      t.string :link
      t.references :band, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
