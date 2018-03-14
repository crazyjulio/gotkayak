class AddBaseVersionFlagToVersions < ActiveRecord::Migration[5.1]
  def up
    add_column :versions, :base_version, :boolean, default: false
  end

  def down
    remove_column :versions, :base_version
  end
end
