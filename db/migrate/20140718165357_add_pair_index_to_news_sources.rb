class AddPairIndexToNewsSources < ActiveRecord::Migration
  def change
    add_index :news_sources, [:name, :base_url], unique: true
  end
end
