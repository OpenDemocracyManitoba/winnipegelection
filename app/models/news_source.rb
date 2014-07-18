class NewsSource < ActiveRecord::Base
  has_many :news_articles, inverse_of: :news_source

  validates :name, :base_url, presence: true
  validates :is_local_source, inclusion: { in: [true, false] }

  def self.find_or_create(news_source)
    find_by(name: news_source[:name],
            base_url: news_source[:base_url]) || create(news_source)
  end
end
