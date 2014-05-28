class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :manufacturer_id
      t.string :name
      t.string :length
      t.string :width
      t.string :height
      t.string :weight
      t.text :description

      t.timestamps
    end
  end
end
