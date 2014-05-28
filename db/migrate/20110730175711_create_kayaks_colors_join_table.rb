class CreateKayaksColorsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :kayaks_colors, :id => false do |t|
      t.integer :kayak_id
      t.integer :color_id
    end
  end

  def self.down
    drop_table :kayaks_colors
  end
end
