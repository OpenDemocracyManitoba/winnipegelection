class ImageMapPolygon < ActiveRecord::Base
  belongs_to :image_map
  belongs_to :electoral_race
end
