class SchoolDivision < ActiveRecord::Base
  has_many :school_wards
  
  validates_presence_of :name
  
  attr_accessible :name, :description, :image, :delete_image
  
  has_attached_file :image, :styles => { :large => "300x300>", :medium => "240x240>", :small => "120x120>", :tiny => "60x60>" },
                    :url  => "/uploads/school_division_image/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/uploads/school_division_image/:id/:style/:basename.:extension"
  
  # Virtual Attribute for image deletion.
  def delete_image=(value)
    self.image = nil if (!value.to_i.zero?)
  end
  
  def delete_image
    false
  end
end
