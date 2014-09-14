class AddUrlIndexToNewsArticles < ActiveRecord::Migration
  def change
    add_index :news_articles, :url, unique: true
  end
end
