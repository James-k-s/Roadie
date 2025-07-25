class AddColumnsToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :address, :string, null: false
    add_column :users, :bio, :text, null: false
  end
end
