class PagesController < ApplicationController
  caches_page :show, :index

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find_page(params)
  end
end
