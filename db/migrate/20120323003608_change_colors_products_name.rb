class ChangeColorsProductsName < ActiveRecord::Migration[5.1]
  def up
    rename_table :colors_products, :product_colors
  end

  def down
    rename_table :product_colors, :colors_products
  end
end
