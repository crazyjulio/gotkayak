class AddImageToPaddlers < ActiveRecord::Migration[5.1]
  def change
    add_column :paddlers, :image, :string
  end
end
