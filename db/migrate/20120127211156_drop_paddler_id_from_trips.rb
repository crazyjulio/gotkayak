class DropPaddlerIdFromTrips < ActiveRecord::Migration
  def up
    remove_column :trips, :paddler_id
  end

  def down
    add_column :trips, :paddler_id, :integer
  end
end
