class PagesController < ApplicationController
  def index
    @pages = Page.all
    @elections = Election.all
  end

  def show
    @page = Page.friendly_find(params)
  end
end
