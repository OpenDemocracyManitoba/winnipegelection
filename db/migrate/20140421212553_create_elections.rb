class CreateElections < ActiveRecord::Migration
  def change
    create_table :elections do |t|
      t.string :name
      t.boolean :is_active
      t.boolean :is_by_election
      t.datetime :writ_date
      t.datetime :election_date

      t.timestamps
    end
  end
end
