class AddImageToClearanceItems < ActiveRecord::Migration[5.1]
  def change
    add_column :clearance_items, :image, :string
  end
end
