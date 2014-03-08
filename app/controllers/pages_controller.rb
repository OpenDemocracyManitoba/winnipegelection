class PagesController < ApplicationController
  def show
    @page = Page.find_page(params)
  end
end
