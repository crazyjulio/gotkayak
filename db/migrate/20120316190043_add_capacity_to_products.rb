class AddCapacityToProducts < ActiveRecord::Migration[5.1]
  def up
    add_column :products, :capacity, :integer
  end

  def down
    remove_column :products, :capacity
  end
end
