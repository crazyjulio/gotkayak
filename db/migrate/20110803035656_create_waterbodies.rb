class CreateWaterbodies < ActiveRecord::Migration
  def self.up
    create_table :waterbodies do |t|
      t.string :country
      t.string :state
      t.string :name
      t.integer :water_type_id
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :waterbodies
  end
end
