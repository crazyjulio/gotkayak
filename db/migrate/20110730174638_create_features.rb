class CreateFeatures < ActiveRecord::Migration[5.1]
  def self.up
    create_table :features do |t|
      t.string :name
      t.text :description
      t.integer :manufacturer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :features
  end
end
