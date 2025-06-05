class AddCoordinatesToBands < ActiveRecord::Migration[7.1]
  def change
    add_column :bands, :latitude, :float
    add_column :bands, :longitude, :float
  end
end
