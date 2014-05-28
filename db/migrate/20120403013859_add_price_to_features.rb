class AddPriceToFeatures < ActiveRecord::Migration
  def up
    add_column :features, :price, :decimal
  end

  def down
    remove_column :features, :price
  end
end
