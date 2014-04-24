class CreateElectoralRaces < ActiveRecord::Migration
  def change
    create_table :electoral_races do |t|
      t.references :region, index: true
      t.references :election, index: true
      t.text :polygon

      t.timestamps
    end

    add_index :electoral_races, [:region_id, :election_id], unique: true
  end
end
