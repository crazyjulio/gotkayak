class ProductsVersionsJoinTable < ActiveRecord::Migration[5.1]
  def up
    create_table :products_versions, id: false do |t|
      t.integer :product_id
      t.integer :version_id
    end
  end

  def down
    drop_table :products_versions
  end
end
