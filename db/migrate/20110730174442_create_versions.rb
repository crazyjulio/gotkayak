class CreateVersions < ActiveRecord::Migration
  def self.up
    create_table :versions do |t|
      t.string :name
      t.text :description
      t.integer :kayak_id
      t.decimal :price
      t.integer :manufacturer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :versions
  end
end
