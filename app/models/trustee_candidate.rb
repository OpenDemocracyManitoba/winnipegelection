class TrusteeCandidate < ActiveRecord::Base
  belongs_to :school_ward
  
  attr_accessible :name, :school_ward_id, :incumbent, :incumbent_since, :website, :facebook, :twitter, :youtube, :phone_number, :email, :image, :delete_image
  
  has_attached_file :image, :styles => { :medium => "300x300>", :small => "200x200>", :thumb => "100x100>" },
                    :url  => "/uploads/trustee_candidate_image/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/uploads/trustee_candidate_image/:id/:style/:basename.:extension"
  # Virtual Attribute for image deletion.
  def delete_image=(value)
    self.image = nil if (!value.to_i.zero?)
  end
  
  def delete_image
    false
  end

end
