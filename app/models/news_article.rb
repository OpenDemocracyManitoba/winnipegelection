class NewsArticle < ActiveRecord::Base
  MODERATION_OPTIONS = ['new', 'approved', 'rejected']
  
  validates_inclusion_of :moderation, :in => MODERATION_OPTIONS
  
  has_many :mentions, :dependent => :destroy
  has_many :candidates, :through => :mentions
  
  attr_accessible :title, :source, :pubdate, :gnews_url, :url, :moderation, :candidate_ids, :rejection
  
  default_scope :order => 'pubdate DESC'
  named_scope :unset, :conditions => "moderation = 'new'"
  named_scope :approved, :conditions => "moderation = 'approved'"
  named_scope :rejected, :conditions => "moderation = 'rejected'"
  named_scope :desc, :order => 'pubdate DESC'
  named_scope :with_mentions, :include => :mentions
  named_scope :with_nested_candidates, :include => {:mentions => [:candidate]}
  named_scope :with_nested_candidates_and_wards, :include => {:mentions, {:candidate, :ward}}
  named_scope :latest, lambda { |*num| { :limit => num.flatten.first || 10, :order => 'pubdate DESC'} }
  
  def pretty_date
    self.pubdate.strftime("%A, %d %B %Y")
  end
  
  def fixed_url
    URI.unescape(self.url)
  end
  
  before_update do |record|
    if record.moderation == 'rejected' && record.mentions.size > 0
      record.rejection ||= ''
      record.rejection += "\n<br/>\nPre-Rejection Mentions: " + record.mentions.inject(""){|str,m| str += "#{m.candidate.name}, "}
      record.mentions.each { |m| m.delete }
    end
  end
  
end
