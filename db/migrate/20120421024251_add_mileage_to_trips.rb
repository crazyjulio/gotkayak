class AddMileageToTrips < ActiveRecord::Migration[5.1]
  def up
    add_column :trips, :mileage, :decimal
  end

  def down
    remove_column :trips, :mileage
  end
end
