class CreateClearanceItems < ActiveRecord::Migration[5.1]
  def change
    create_table :clearance_items do |t|
      t.integer :product_id
      t.integer :color_id
      t.integer :version_id
      t.string :clearance_reason
      t.decimal :price
      t.string :year
      t.integer :quantity

      t.timestamps
    end
  end
end
