class CreateColors < ActiveRecord::Migration
  def self.up
    create_table :colors do |t|
      t.string :name
      t.text :description
      t.integer :manufacturer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :colors
  end
end
