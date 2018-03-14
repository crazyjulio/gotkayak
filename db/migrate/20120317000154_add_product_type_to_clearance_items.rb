class AddProductTypeToClearanceItems < ActiveRecord::Migration[5.1]
  def up
    add_column :clearance_items, :product_type, :string
  end

  def down
    remove_column :clearance_items, :product_type
  end
end
