class RenameCandidatesToPeople < ActiveRecord::Migration
  def change
    rename_table :candidates, :people
  end
end
