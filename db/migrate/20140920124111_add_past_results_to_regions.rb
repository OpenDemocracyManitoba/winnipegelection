class AddPastResultsToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :past_results, :text
  end
end
