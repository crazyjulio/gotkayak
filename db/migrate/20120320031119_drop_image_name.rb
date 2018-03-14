class DropImageName < ActiveRecord::Migration[5.1]
  def up
    remove_column :images, :name
  end

  def down
    add_column :images, :name, :string
  end
end
