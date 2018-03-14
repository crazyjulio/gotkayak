class AddFieldsToTrip < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :launch_location, :string
    add_column :trips, :takeout_location, :string
    add_column :trips, :nearest_water_gauge, :string
    add_column :trips, :runnable_range, :string
  end
end
