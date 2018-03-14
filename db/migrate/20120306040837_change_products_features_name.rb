class ChangeProductsFeaturesName < ActiveRecord::Migration[5.1]
  def up
    rename_table :products_features, :features_products
  end

  def down
    rename_table :features_products, :products_features
  end
end
