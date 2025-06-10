class RenameTypeToStatusOnEvents < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :type, :integer, default: 0
    add_column :events, :status, :integer, default: 0
  end
end
