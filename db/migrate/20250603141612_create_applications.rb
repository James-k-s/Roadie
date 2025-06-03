class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.text :pitch
      t.boolean :accepted
      t.string :meeting_link
      t.datetime :start_time
      t.datetime :end_time
      t.references :vacancy, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
