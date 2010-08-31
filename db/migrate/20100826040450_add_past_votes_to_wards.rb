class AddPastVotesToWards < ActiveRecord::Migration
  def self.up
    add_column :wards, :past_votes, :text
  end

  def self.down
    remove_column :wards, :past_votes
  end
end
