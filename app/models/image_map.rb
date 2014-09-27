class ImageMap < ActiveRecord::Base
  has_many :image_map_polygons
  has_many :electoral_races, through: :image_map_polygons

  validates :name, presence: true

  mount_uploader :image, ImageMapUploader

  include FriendlyURL
  def slug_for_friendly_url
    name.parameterize
  end

  def electoral_races_ordered_by_region_name
    electoral_races.includes(:region)
                   .order('regions.name ASC')
  end
end
