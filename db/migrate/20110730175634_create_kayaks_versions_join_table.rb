class CreateKayaksVersionsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :kayaks_versions, :id => false do |t|
      t.integer :kayak_id
      t.integer :version_id
    end
  end

  def self.down
    drop_table :kayaks_versions
  end
end
