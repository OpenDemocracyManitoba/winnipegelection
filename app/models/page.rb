class Page < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  validates :title, :permalink, presence: true

  # Ensures that the permalink is URL encoded.
  def permalink_param
    permalink.parameterize
  end

  # Builds a friendly URL that includes the permalink
  # Used like this: link_to page.title, page.friendly_path
  def friendly_path
    page_path(id: id, permalink: permalink_param)
  end

  # Synonym for title for ActiveAdmin which assumes a name property.
  def name
    title
  end

  # Finds page by id, but throws an exception if the permalink slug from the
  # URL doesn't match the page permalink.
  def self.find_page(params)
    page = find(params[:id])
    if page.permalink_param != params[:permalink]
      fail ActiveRecord::RecordNotFound
    else
      page
    end
  end
end
