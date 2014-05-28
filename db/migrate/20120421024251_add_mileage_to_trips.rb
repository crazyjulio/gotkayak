class AddMileageToTrips < ActiveRecord::Migration
  def up
    add_column :trips, :mileage, :decimal
  end

  def down
    remove_column :trips, :mileage
  end
end
