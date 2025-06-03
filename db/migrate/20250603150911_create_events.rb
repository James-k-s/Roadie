class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :content
      t.datetime :start_time
      t.datetime :end_time
      t.references :band_member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
