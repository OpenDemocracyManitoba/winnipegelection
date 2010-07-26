class CreateNewsArticles < ActiveRecord::Migration
  def self.up
    create_table :news_articles do |t|
      t.string :title
      t.string :source
      t.datetime :pubdate
      t.text :summary
      t.text :gnews_url
      t.string :url
      t.string :moderation
      t.timestamps
    end
  end
  
  def self.down
    drop_table :news_articles
  end
end
