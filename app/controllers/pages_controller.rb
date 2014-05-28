class PagesController < ApplicationController
  def index
    @pages = Page.all
    @election = Election.where(is_active: false).first
  end

  def show
    @page = Page.find_page(params)
  end
end
