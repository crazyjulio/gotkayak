class AddProductIdToVersions < ActiveRecord::Migration
  def up
    add_column :versions, :product_id, :integer
  end

  def down
    remove_column :versions, :product_id
  end
end
