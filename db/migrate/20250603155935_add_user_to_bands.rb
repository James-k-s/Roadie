class AddUserToBands < ActiveRecord::Migration[7.1]
  def change
    add_reference :bands, :user, null: false, foreign_key: true
  end
end
