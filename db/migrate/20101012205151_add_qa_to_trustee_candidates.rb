class AddQaToTrusteeCandidates < ActiveRecord::Migration
  def self.up
    add_column :trustee_candidates, :qa, :text
  end

  def self.down
    remove_column :trustee_candidates, :qa
  end
end
