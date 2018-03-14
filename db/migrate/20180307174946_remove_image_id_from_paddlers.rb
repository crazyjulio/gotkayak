class RemoveImageIdFromPaddlers < ActiveRecord::Migration[5.1]
  def change
    remove_column(:paddlers, :image_id)
  end
end
