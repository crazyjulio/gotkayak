class AddBasePriceToProducts < ActiveRecord::Migration[5.1]
  def up
    add_column :products, :base_price, :decimal
  end

  def down
    remove_column :products, :base_price
  end
end
