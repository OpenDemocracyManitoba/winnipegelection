class CreateCandidacies < ActiveRecord::Migration
  def change
    create_table :candidacies do |t|
      t.text :questionnaire
      t.datetime :end_date
      t.boolean :is_incumbent
      t.boolean :is_winner
      t.references :person
      t.references :electoral_race

      t.timestamps
    end
  end
end
