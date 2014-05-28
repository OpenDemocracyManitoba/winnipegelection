class AddSeatsToFillToElectoralRaces < ActiveRecord::Migration
  def change
    add_column :electoral_races, :seats_to_fill, :integer
  end
end
