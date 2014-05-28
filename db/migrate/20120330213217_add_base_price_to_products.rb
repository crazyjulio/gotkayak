class AddBasePriceToProducts < ActiveRecord::Migration
  def up
    add_column :products, :base_price, :decimal
  end

  def down
    remove_column :products, :base_price
  end
end
