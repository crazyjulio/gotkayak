class ChangeFeaturesProductsName < ActiveRecord::Migration[5.1]
  def up
    rename_table :features_products, :product_features
  end

  def down
    rename_table :product_features, :features_products
  end
end
