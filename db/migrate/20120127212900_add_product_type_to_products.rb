class AddProductTypeToProducts < ActiveRecord::Migration[5.1]
  def up
    add_column :products, :product_type, :string
  end

  def down
    remove_column :products, :product_type
  end
end
