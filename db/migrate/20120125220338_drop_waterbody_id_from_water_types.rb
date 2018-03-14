class DropWaterbodyIdFromWaterTypes < ActiveRecord::Migration[5.1]
  def up
    remove_column :water_types, :waterbody_id
  end

  def down
    add_column :water_types, :waterbody_id, :integer
  end
end
