class DropVersionFeatures < ActiveRecord::Migration[5.1]
  def change
    drop_table :version_features
  end
end
