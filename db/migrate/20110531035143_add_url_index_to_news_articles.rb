class AddUrlIndexToNewsArticles < ActiveRecord::Migration
  def self.up
    add_index :news_articles, :url
  end

  def self.down
    remove_index :news_articles, :url
  end
end
