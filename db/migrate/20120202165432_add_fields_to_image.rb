class AddFieldsToImage < ActiveRecord::Migration
  def up
    add_column :images, :model, :string
    add_column :images, :model_id, :integer
    add_column :images, :caption, :text
    add_column :images, :tag, :string
  end

  def down
    remove_column :images, :model_id
    remove_column :images, :model
    remove_column :images, :caption
    remove_column :images, :tag
  end
end
