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

  def parental_regions_ordered_by_region_name
    electoral_races.group_by { |electoral_race| electoral_race.region.parent_region.name }
                   .sort
  end

  def contains_nested_electoral_races?
    electoral_races.joins(:region).where('regions.region_id > 0').present?
  end
end
