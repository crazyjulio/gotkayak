class RemoveBasePriceFromProducts < ActiveRecord::Migration[5.1]
  def up
    remove_column :products, :base_price
  end

  def down
    add_column :products, :base_price, :decimal
  end
end
