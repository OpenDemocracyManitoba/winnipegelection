
class Person < ActiveRecord::Base
  has_many :candidacies, inverse_of: :person
  has_many :electoral_races, through: :candidacies
  has_many :news_mentions, inverse_of: :person, dependent: :destroy
  has_many :news_articles, through: :news_mentions
  has_many :approved_news_articles,
           -> { where news_articles: { moderation: 'approved' } },
           through: :news_mentions,
           class_name: 'NewsArticle',
           source: :news_article

  validates :name, presence: true
  validates :website, :council_site, :facebook, :twitter, :youtube, :linkedin,
            url: { allow_blank: true }

  mount_uploader :image, ProfileImageUploader

  include FriendlyURL
  def slug_for_friendly_url
    name.parameterize
  end

  def most_recent_candidacy
    @most_recent_candidacy ||= candidacies.includes(electoral_race: :election)
                                          .order('elections.election_date')
                                          .last
  end

  def most_recent_election
    most_recent_candidacy.electoral_race.election
  end

  def approved_news_mentions
    news_mentions.includes(:news_article)
                 .where(news_articles: { moderation: 'approved'  })
                 .order('news_articles.publication_date DESC')
  end
end
