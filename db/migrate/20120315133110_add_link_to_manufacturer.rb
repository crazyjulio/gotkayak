class AddLinkToManufacturer < ActiveRecord::Migration
  def up
    add_column :manufacturers, :link, :string
  end

  def down
    remove_column :manufacturers, :link
  end
end
