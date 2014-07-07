class NewsArticle < ActiveRecord::Base
  belongs_to :news_source
  has_many :news_mentions, inverse_of: :news_article
end
