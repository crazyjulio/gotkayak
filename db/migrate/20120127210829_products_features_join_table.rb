class ProductsFeaturesJoinTable < ActiveRecord::Migration
  def up
    create_table :products_features, :id => false do |t|
      t.integer :product_id
      t.integer :feature_id
    end
  end

  def down
    drop_table :products_features
  end
end
