class AddQaToCandidates < ActiveRecord::Migration
  def self.up
    add_column :candidates, :qa, :text
  end

  def self.down
    remove_column :candidates, :qa
  end
end
