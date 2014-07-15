class RemoveGoogleNewsUrlFromNewsArticles < ActiveRecord::Migration
  def change
    remove_column :news_articles, :google_news_url, :string
  end
end
