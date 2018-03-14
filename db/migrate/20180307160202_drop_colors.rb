class DropColors < ActiveRecord::Migration[5.1]
  def change
    drop_table :colors
  end
end
