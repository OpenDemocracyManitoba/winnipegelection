class TweakCandidates < ActiveRecord::Migration
  def self.up
    remove_column :candidates, :dob
    add_column :candidates, :majorissues, :text
  end

  def self.down
    add_column :candidates, :dob, :datetime
    remove_column :majorissues
  end
end
