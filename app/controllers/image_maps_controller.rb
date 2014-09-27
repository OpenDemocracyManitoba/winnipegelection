class ImageMapsController < ApplicationController
  def show
    @image_map = ImageMap.friendly_find(params)
  end
end
