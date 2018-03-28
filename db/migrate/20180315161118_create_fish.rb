class CreateFish < ActiveRecord::Migration[5.1]
  def change
    create_table :fish do |t|
      t.string :species
      t.integer :length
      t.integer :weight
      t.string :location
      t.string :water_type
      t.date :catch_date
      t.json :comments
      t.integer :disputed_by
      t.text :user_comment
      t.integer :user_id
      t.integer :competition_id

      t.timestamps
    end
  end
end
