class NewsArticle < ActiveRecord::Base
  belongs_to :news_source, inverse_of: :news_articles
  has_many :news_mentions, inverse_of: :news_article, dependent: :destroy
  has_many :people, through: :news_mentions

  validates :news_source, presence: true
end
