class CreateBands < ActiveRecord::Migration[7.1]
  def change
    create_table :bands do |t|
      t.string :name
      t.string :address
      t.text :bio
      t.string :genre

      t.timestamps
    end
  end
end
