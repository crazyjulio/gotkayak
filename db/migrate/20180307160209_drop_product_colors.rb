class DropProductColors < ActiveRecord::Migration[5.1]
  def change
    drop_table :product_colors
  end
end
