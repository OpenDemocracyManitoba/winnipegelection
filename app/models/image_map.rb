class ImageMap < ActiveRecord::Base
  validates :name, presence: true

  mount_uploader :image, ImageMapUploader
end
