class Candidate < ActiveRecord::Base
  attr_accessible :name, :ward_id, :incumbent_since, :website, :facebook, :twitter, :youtube, :office_address, :phone_number, :email, :image_url, :dob
end
