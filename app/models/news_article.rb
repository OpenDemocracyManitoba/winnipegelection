class NewsArticle < ActiveRecord::Base
  has_and_belongs_to_many :candidates, :join_table => 'candidates_news_articles'
  attr_accessible :title, :source, :pubdate, :summary, :gnews_url, :url, :moderation, :candidate_ids
end
