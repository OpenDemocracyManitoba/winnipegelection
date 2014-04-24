class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find_page(params)
  end
end
