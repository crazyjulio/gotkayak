class CreateManufacturers < ActiveRecord::Migration[5.1]
  def self.up
    create_table :manufacturers do |t|
      t.string :name
      t.text :description
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :manufacturers
  end
end
