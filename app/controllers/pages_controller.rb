class PagesController < ApplicationController
  caches_page :index, :show

  def index
    @pages = Page.all
  end

  def show
    @page = Page.friendly_find(params)
  end
end
