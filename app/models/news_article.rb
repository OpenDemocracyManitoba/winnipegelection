class NewsArticle < ActiveRecord::Base
  MODERATION_OPTIONS = ['new', 'approved', 'rejected']
  
  validates_inclusion_of :moderation, :in => MODERATION_OPTIONS
  
  has_many :mentions, :dependent => :destroy
  has_many :candidates, :through => :mentions
  
  attr_accessible :title, :source, :pubdate, :gnews_url, :url, :moderation, :candidate_ids
end
