class AddPaddlerKayakToTrips < ActiveRecord::Migration[5.1]
  def up
    add_column :trips, :paddler_kayak, :text
  end

  def down
    remove_column :trips, :paddler_kayak
  end
end
