class AddProductTypeToClearanceItems < ActiveRecord::Migration
  def up
    add_column :clearance_items, :product_type, :string
  end

  def down
    remove_column :clearance_items, :product_type
  end
end
