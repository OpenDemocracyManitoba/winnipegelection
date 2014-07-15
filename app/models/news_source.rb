class NewsSource < ActiveRecord::Base
  has_many :news_articles, inverse_of: :news_source

  validates :name, :base_url, presence: true
  validates :is_local_source, inclusion: { in: [true, false] }

  def self.find_or_create_by_name(news_source)
    find_by(name: news_source[:name]) || create(news_source)
  end
end
