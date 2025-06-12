class AddBandsToAlbums < ActiveRecord::Migration[7.1]
  def change
    add_reference :albums, :band, foreign_key: true
  end
end
