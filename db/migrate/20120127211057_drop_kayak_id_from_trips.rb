class DropKayakIdFromTrips < ActiveRecord::Migration[5.1]
  def up
    remove_column :trips, :kayak_id
  end

  def down
    add_column :trips, :kayak_id, :integer
  end
end
