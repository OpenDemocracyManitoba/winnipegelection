class Person < ActiveRecord::Base
  has_many :candidacies, inverse_of: :person
  has_many :electoral_races, through: :candidaces
  
  validates :name, presence: true

  mount_uploader :image, ProfileImageUploader
end
