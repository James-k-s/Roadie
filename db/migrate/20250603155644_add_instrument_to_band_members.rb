class AddInstrumentToBandMembers < ActiveRecord::Migration[7.1]
  def change
    add_reference :band_members, :instrument, null: false, foreign_key: true
  end
end
