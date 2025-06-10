class AddPromptToAlbums < ActiveRecord::Migration[7.1]
  def change
    add_column :albums, :prompt, :string
  end
end
