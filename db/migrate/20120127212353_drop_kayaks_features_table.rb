class DropKayaksFeaturesTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :kayaks_features
  end

  def down
    create_table :kayaks_features, id: false do |t|
      t.integer :kayak_id
      t.integer :feature_id
    end
  end
end
