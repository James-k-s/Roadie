class RemoveBandMemberIdFromInstruments < ActiveRecord::Migration[7.1]
  def change
    remove_column :instruments, :band_member_id, :bigint
  end
end
