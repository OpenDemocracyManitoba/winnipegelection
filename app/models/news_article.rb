class NewsArticle < ActiveRecord::Base
  MODERATION_OPTIONS = %w(pending approved rejected)

  belongs_to :news_source, inverse_of: :news_articles
  has_many :news_mentions, inverse_of: :news_article, dependent: :destroy
  has_many :people, through: :news_mentions

  validates :moderation, inclusion: { in: MODERATION_OPTIONS }

  def pretty_date
    publication_date.blank? ? '' : publication_date.strftime('%A, %d %B %Y')
  end

  def self.find_or_create_by_url(article)
    find_by(url: article[:url]) || create(article)
  end

  def self.pending
    where(moderation: 'pending')
  end

  def self.approved
    where(moderation: 'approved')
  end

  def self.rejected
    where(moderation: 'rejected')
  end
end
