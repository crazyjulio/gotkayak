class CreateWaterTypes < ActiveRecord::Migration[5.1]
  def self.up
    create_table :water_types do |t|
      t.string :name
      t.integer :waterbody_id

      t.timestamps
    end
  end

  def self.down
    drop_table :water_types
  end
end
