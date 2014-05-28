class DropProductVersionsJoinTable < ActiveRecord::Migration
  def up
    drop_table :products_versions
  end

  def down
    create_table :products_versions, :id => false do |t|
      t.integer :product_id
      t.integer :version_id
    end
  end
end
