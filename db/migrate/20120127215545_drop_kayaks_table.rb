class DropKayaksTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :kayaks unless defined?(Kayak).nil?
  end

  def down; end
end
