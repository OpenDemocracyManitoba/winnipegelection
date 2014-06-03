class Page < ActiveRecord::Base
  include FriendlyURL

  validates :title, :permalink, presence: true

  # Used by the FriendlyURL concern as the slug for the friendly url.
  def slug
    permalink.parameterize
  end

  # Synonym for title for ActiveAdmin which assumes a name property.
  def name
    title
  end
end
