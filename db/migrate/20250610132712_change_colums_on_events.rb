class ChangeColumsOnEvents < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :band_member_id, foreign_key: true
    add_reference :events, :user1, foreign_key: { to_table: :users }
    add_reference :events, :user2, foreign_key: { to_table: :users }
    add_reference :events, :band, foreign_key: true
    add_column :events, :address, :string
    add_column :events, :latitude, :float
    add_column :events, :longitude, :float
    add_column :events, :type, :integer, default: 0
  end
end
