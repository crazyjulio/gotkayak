class DropKayaksTable < ActiveRecord::Migration
  def up
    drop_table :kayaks unless defined?(Kayak).nil?
  end

  def down
  end
end
