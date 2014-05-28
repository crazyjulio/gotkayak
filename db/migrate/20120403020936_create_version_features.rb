class CreateVersionFeatures < ActiveRecord::Migration
  def up
    create_table :version_features, :id => false do |t|
      t.integer :version_id
      t.integer :feature_id
    end
  end

  def down
    drop_table :version_features
  end
end
