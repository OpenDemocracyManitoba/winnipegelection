class AddOtherResourcesToCandidates < ActiveRecord::Migration
  def self.up
    add_column :candidates, :other_resources, :text
  end

  def self.down
    remove_column :candidates, :other_resources
  end
end
