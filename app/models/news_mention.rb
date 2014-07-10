class NewsMention < ActiveRecord::Base
  belongs_to :person, inverse_of: :news_mentions
  belongs_to :news_article, inverse_of: :news_mentions

  validates :person, :news_article, presence: true
end
