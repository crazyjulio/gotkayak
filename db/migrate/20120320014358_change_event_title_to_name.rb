class ChangeEventTitleToName < ActiveRecord::Migration
  def up
    rename_column :events, :title, :name
  end

  def down
    rename_column :events, :name, :title
  end
end
