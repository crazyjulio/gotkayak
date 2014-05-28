class DropProductFeaturesTable < ActiveRecord::Migration
  def up
    drop_table :product_features
  end

  def down
    create_table :product_features, :id => false do |t|
      t.integer :product_id
      t.integer :feature_id
    end
  end
end
