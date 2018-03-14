class ChangeEventTitleToName < ActiveRecord::Migration[5.1]
  def up
    rename_column :events, :title, :name
  end

  def down
    rename_column :events, :name, :title
  end
end
