class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.friendly_find(params)
  end
end
