class DropKayakIdFromVersions < ActiveRecord::Migration
  def up
    remove_column :versions, :kayak_id
  end

  def down
    add_column :trips, :kayak_id, :integer
  end
end
