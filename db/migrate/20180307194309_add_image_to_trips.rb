class AddImageToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :images, :json
  end
end
