class CreateInstruments < ActiveRecord::Migration[7.1]
  def change
    create_table :instruments do |t|
      t.string :name
      t.integer :experience
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.references :band_member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
