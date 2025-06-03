class CreateVacancies < ActiveRecord::Migration[7.1]
  def change
    create_table :vacancies do |t|
      t.string :instrument
      t.text :description
      t.boolean :filled
      t.references :band, null: false, foreign_key: true

      t.timestamps
    end
  end
end
