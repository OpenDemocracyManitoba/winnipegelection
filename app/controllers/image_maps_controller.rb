class ImageMapsController < ApplicationController
  caches_page :show

  def show
    @image_map = ImageMap.friendly_find(params)
  end
end
