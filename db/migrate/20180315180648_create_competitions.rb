class CreateCompetitions < ActiveRecord::Migration[5.1]
  def change
    create_table :competitions do |t|
      t.string :year
      t.json :stats

      t.timestamps
    end
  end
end
