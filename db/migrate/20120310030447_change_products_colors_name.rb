class ChangeProductsColorsName < ActiveRecord::Migration[5.1]
  def up
    rename_table :products_colors, :colors_products
  end

  def down
    rename_table :colors_products, :products_colors
  end
end
