class ChangeWaterbodiesWaterTypeIdToWaterType < ActiveRecord::Migration[5.1]
  def up
    remove_column :waterbodies, :water_type_id
    add_column :waterbodies, :water_type, :string
  end

  def down
    add_column :waterbodies, :water_type_id, :integer
    remove_column :waterbodies, :water_type
  end
end
