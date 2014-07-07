class NewsSource < ActiveRecord::Base
  has_many :news_articles, inverse_of: :news_source
end
