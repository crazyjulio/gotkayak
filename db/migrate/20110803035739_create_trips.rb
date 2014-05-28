class CreateTrips < ActiveRecord::Migration
  def self.up
    create_table :trips do |t|
      t.string :name
      t.integer :waterbody_id
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.integer :kayak_id
      t.integer :paddler_id

      t.timestamps
    end
  end

  def self.down
    drop_table :trips
  end
end
