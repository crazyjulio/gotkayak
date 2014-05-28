class DropKayaksColorsTable < ActiveRecord::Migration
  def up
    drop_table :kayaks_colors
  end

  def down
    create_table :kayaks_colors, :id => false do |t|
      t.integer :kayak_id
      t.integer :color_id
    end
  end
end
