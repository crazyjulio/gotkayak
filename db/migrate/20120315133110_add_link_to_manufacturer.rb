class AddLinkToManufacturer < ActiveRecord::Migration[5.1]
  def up
    add_column :manufacturers, :link, :string
  end

  def down
    remove_column :manufacturers, :link
  end
end
