class DropKayaksVersionsTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :kayaks_versions
  end

  def down
    create_table :kayaks_versions, id: false do |t|
      t.integer :kayak_id
      t.integer :version_id
    end
  end
end
