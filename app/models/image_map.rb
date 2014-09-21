class ImageMap < ActiveRecord::Base
  has_many :image_map_polygons

  validates :name, presence: true

  mount_uploader :image, ImageMapUploader
end
