class ChangeImagesUrlToFile < ActiveRecord::Migration[5.1]
  def up
    rename_column :images, :url, :file
  end

  def down
    rename_column :images, :file, :url
  end
end
