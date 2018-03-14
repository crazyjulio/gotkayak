class AddProductIdToVersions < ActiveRecord::Migration[5.1]
  def up
    add_column :versions, :product_id, :integer
  end

  def down
    remove_column :versions, :product_id
  end
end
