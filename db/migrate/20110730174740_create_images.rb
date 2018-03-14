class CreateImages < ActiveRecord::Migration[5.1]
  def self.up
    create_table :images do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
