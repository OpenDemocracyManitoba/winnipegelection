class PagesController < ApplicationController
  def index
    @pages = Page.all
    @elections = Election.all
  end

  def show
    @page = Page.find_page(params)
  end
end
