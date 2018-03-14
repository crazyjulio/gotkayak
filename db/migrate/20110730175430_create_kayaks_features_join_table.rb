class CreateKayaksFeaturesJoinTable < ActiveRecord::Migration[5.1]
  def self.up
    create_table :kayaks_features, id: false do |t|
      t.integer :kayak_id
      t.integer :feature_id
    end
  end

  def self.down
    drop_table :kayaks_features
  end
end
