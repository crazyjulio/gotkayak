class ChangeImagesUrlToFile < ActiveRecord::Migration
  def up
    rename_column :images, :url, :file
  end

  def down
    rename_column :images, :file, :url
  end
end
