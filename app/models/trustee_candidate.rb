class TrusteeCandidate < ActiveRecord::Base
  belongs_to :school_ward
  
  attr_accessible :name, :school_ward_id, :incumbent_since, :website, :facebook, :twitter, :youtube, :phone_number, :email, :image, :delete_image, :qa
  
  has_attached_file :image, :styles => { :medium => "300x300>", :small => "200x200>", :thumb => "100x100>" },
                    :url  => "/uploads/trustee_candidate_image/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/uploads/trustee_candidate_image/:id/:style/:basename.:extension"
                    
                    
  named_scope :with_division_ward, :include => {:school_ward => :school_division }
  named_scope :incumbent, :conditions => "incumbent_since IS NOT NULL"
  named_scope :by_name, lambda { |name|
    {:conditions => ["trustee_candidates.name = ?", name]}
  }
                    
  # Virtual Attribute for image deletion.
  def delete_image=(value)
    self.image = nil if (!value.to_i.zero?)
  end
  
  def delete_image
    false
  end
  
  def candidate_url
    '/trustee_candidate/' + self.name.gsub(' ','_')
  end
  
  def rss_url
    false
  end
  
  def self.url_to_candidate(url)
    url.gsub('_',' ')
  end
  
end
