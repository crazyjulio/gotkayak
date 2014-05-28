class DropWaterTypes < ActiveRecord::Migration
  def up
    drop_table :water_types
  end

  def down
    create_table :water_types do |t|
      t.string :name
      t.integer :waterbody_id
      t.timestamps
    end
  end
end
