class AddStatsToWards < ActiveRecord::Migration
  def self.up
    add_column :wards, :stats, :text
  end

  def self.down
    remove_column :wards, :stats
  end
end
