class CreateElectoralRaces < ActiveRecord::Migration
  def change
    create_table :electoral_races do |t|
      t.references :region, index: true
      t.references :election, index: true
      t.text :polygon

      t.timestamps
    end
  end
end
