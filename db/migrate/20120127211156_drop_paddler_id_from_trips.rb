class DropPaddlerIdFromTrips < ActiveRecord::Migration[5.1]
  def up
    remove_column :trips, :paddler_id
  end

  def down
    add_column :trips, :paddler_id, :integer
  end
end
