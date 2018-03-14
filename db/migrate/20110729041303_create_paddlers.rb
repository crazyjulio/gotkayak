class CreatePaddlers < ActiveRecord::Migration[5.1]
  def self.up
    create_table :paddlers do |t|
      t.string :name
      t.integer :image_id
      t.string :height
      t.string :weight

      t.timestamps
    end
  end

  def self.down
    drop_table :paddlers
  end
end
