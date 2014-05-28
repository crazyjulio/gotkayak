class ProductsColorsJoinTable < ActiveRecord::Migration
  def up
    create_table :products_colors, :id => false do |t|
      t.integer :product_id
      t.integer :color_id
    end
  end

  def down
    drop_table :products_colors
  end
end
