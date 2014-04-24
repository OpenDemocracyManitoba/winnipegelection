class CreateCandidacies < ActiveRecord::Migration
  def change
    create_table :candidacies do |t|
      t.text :questionnaire
      t.datetime :end_date
      t.boolean :is_incumbent
      t.boolean :is_winner
      t.references :person, index: true
      t.references :electoral_race, index: true

      t.timestamps
    end

    add_index :candidacies, [:person_id, :electoral_race_id], unique: true
  end
end
