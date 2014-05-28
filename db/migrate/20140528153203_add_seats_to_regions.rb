class AddSeatsToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :seats, :integer
  end
end
