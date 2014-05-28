class DropImageName < ActiveRecord::Migration
  def up
    remove_column :images, :name
  end

  def down
    add_column :images, :name, :string
  end
end
