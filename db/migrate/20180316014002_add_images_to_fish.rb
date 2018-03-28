class AddImagesToFish < ActiveRecord::Migration[5.1]
  def change
    add_column :fish, :images, :json
  end
end
