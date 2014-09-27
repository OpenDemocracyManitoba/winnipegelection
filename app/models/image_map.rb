class ImageMap < ActiveRecord::Base
  has_many :image_map_polygons

  validates :name, presence: true

  mount_uploader :image, ImageMapUploader
  
  include FriendlyURL
  def slug_for_friendly_url
    name.parameterize
  end
end
