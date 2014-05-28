class AddPaddlerKayakToTrips < ActiveRecord::Migration
  def up
    add_column :trips, :paddler_kayak, :text
  end

  def down
    remove_column :trips, :paddler_kayak
  end
end
