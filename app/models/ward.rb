class Ward < ActiveRecord::Base
  attr_accessible :name, :pdf_map_url, :image
  
  has_attached_file :image, :styles => { :large => "700x700>", :medium => "600x600>", :small => "500x500>", :thumb => "300x300>" },
                    :url  => "/uploads/ward_image/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/uploads/ward_image/:id/:style/:basename.:extension"
end
