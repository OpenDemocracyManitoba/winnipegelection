class AddIsLocalSourceToNewsSources < ActiveRecord::Migration
  def change
    add_column :news_sources, :is_local_source, :boolean
  end
end
