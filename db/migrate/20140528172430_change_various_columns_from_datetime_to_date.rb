class ChangeVariousColumnsFromDatetimeToDate < ActiveRecord::Migration
  def up
    change_column :candidacies, :end_date, :date
    change_column :elections, :writ_date, :date
    change_column :elections, :election_date, :date
    change_column :regions, :start_date, :date
    change_column :regions, :end_date, :date
  end

  def down
    change_column :candidacies, :end_date, :datetime
    change_column :elections, :writ_date, :datetime
    change_column :elections, :election_date, :datetime
    change_column :regions, :start_date, :datetime
    change_column :regions, :end_date, :datetime
  end
end
