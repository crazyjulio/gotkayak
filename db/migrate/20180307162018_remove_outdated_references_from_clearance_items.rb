class RemoveOutdatedReferencesFromClearanceItems < ActiveRecord::Migration[5.1]
  def change
    change_column(:clearance_items, :product_id, :string)
    rename_column(:clearance_items, :product_id, :product)

    change_column(:clearance_items, :color_id, :string)
    rename_column(:clearance_items, :color_id, :color)

    change_column(:clearance_items, :version_id, :string)
    rename_column(:clearance_items, :version_id, :version_name)

    remove_column(:clearance_items, :product_type)
  end
end
