class Ward < ActiveRecord::Base
  extend Random
  
  WARD_TYPES = ['Civic','School Division','Mayoral']
  
  has_many :candidates, :order => db_random
  
  validates_presence_of :name, :ward_type
  validates_inclusion_of :ward_type, :in => WARD_TYPES, :message => "must be: #{WARD_TYPES.join(', ')}"
  
  attr_accessible :name, :pdf_map_url, :ward_type, :image
  
  has_attached_file :image, :styles => { :large => "700x700>", :medium => "600x600>", :small => "500x500>", :thumb => "300x300>" },
                    :url  => "/uploads/ward_image/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/uploads/ward_image/:id/:style/:basename.:extension"
  
  named_scope :council, :conditions => "ward_type = 'Civic'"
  named_scope :mayoral, :conditions => "ward_type = 'Mayoral'"
  named_scope :with_candidates, :include => {:candidates => [:news_articles]}, :order => db_random #, :conditions => "news_articles.moderation != 'rejected'", :order => db_random
  
  
  def ward_url
    self.name.sub(/^St\./,'St').gsub(' ','_')
  end
  
  def self.url_to_ward(url)
    url.sub(/^St/,'St.').gsub('_',' ')
  end
end