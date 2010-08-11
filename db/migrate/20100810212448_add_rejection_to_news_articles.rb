class AddRejectionToNewsArticles < ActiveRecord::Migration
  def self.up
    add_column :news_articles, :rejection, :text
  end

  def self.down
    remove_column :news_articles, :rejection
  end
end
