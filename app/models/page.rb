class Page < ActiveRecord::Base
  validates :title, :permalink, presence: true

  include FriendlyURL
  def slug_for_friendly_url
    title.parameterize
  end

  # Synonym for title for ActiveAdmin which assumes a name property.
  def name
    title
  end
end
