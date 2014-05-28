class AddCapacityToProducts < ActiveRecord::Migration
  def up
    add_column :products, :capacity, :integer
  end

  def down
    remove_column :products, :capacity
  end
end
