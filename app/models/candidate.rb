class Candidate < ActiveRecord::Base
  belongs_to :ward
  has_and_belongs_to_many :news_articles, :join_table => 'candidates_news_articles'
  
  validates_presence_of :name, :ward_id
  
  attr_accessible :name, :ward_id, :incumbent_since, :website, :facebook, :twitter, :youtube, :office_address, :phone_number, :email, :image_url, :dob, :image
  
  has_attached_file :image, :styles => { :medium => "300x300>", :small => "200x200>", :thumb => "100x100>" },
                    :url  => "/uploads/candidate_image/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/uploads/candidate_image/:id/:style/:basename.:extension"
end
