class CandidatesNewsArticles < ActiveRecord::Migration
  def self.up
    create_table :candidates_news_articles, :id => false do |t|
      t.integer :candidate_id, :null => false
      t.integer :news_article_id, :null => false
    end
  end

  def self.down
    drop_table :candidates_news_articles
  end
end
