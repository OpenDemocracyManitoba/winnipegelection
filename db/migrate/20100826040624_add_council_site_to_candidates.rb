class AddCouncilSiteToCandidates < ActiveRecord::Migration
  def self.up
    add_column :candidates, :council_site, :string
  end

  def self.down
    remove_column :candidates, :council_site
  end
end
