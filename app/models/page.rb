class Page < ActiveRecord::Base
  validates :title, :permalink, presence: true

  scope :cms_pages, -> { all }

  include FriendlyURL
  def slug_for_friendly_url
    title.parameterize
  end

  # Synonym for title for ActiveAdmin which assumes a name property.
  def name
    title
  end
end
