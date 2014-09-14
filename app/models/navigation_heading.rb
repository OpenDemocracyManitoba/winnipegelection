class NavigationHeading < ActiveRecord::Base
  has_many :pages, -> { order :title }
  has_many :electoral_races, -> { includes(region: :region_type).includes(:election) }

  # Self-Join for Sub-Headings / Parent Headings
  has_many :sub_headings,
           -> { order :display_order },
           class_name: 'NavigationHeading',
           foreign_key: 'navigation_heading_id',
           inverse_of: :parent_heading
  belongs_to :parent_heading,
             class_name: 'NavigationHeading',
             foreign_key: 'navigation_heading_id',
             inverse_of: :sub_headings

  validate :sub_headings_must_have_a_url
  def sub_headings_must_have_a_url
    error_msg = 'cannot be blank for sub headings'
    errors.add(:url, error_msg)  if sub_heading? && url.blank?
  end

  validate :sub_headings_cannot_be_parent_headings
  def sub_headings_cannot_be_parent_headings
    error_msg = 'sub-headings cannot be assigned as a parent heading'
    errors.add(:navigation_heading_id, error_msg)  if sub_heading? &&
                                                      parent_heading.sub_heading?
  end

  validate :parent_headings_cannot_be_sub_headings
  def parent_headings_cannot_be_sub_headings
    error_msg = 'parent headings cannot be assigned parents themselves'
    errors.add(:navigation_heading_id, error_msg)  if parent_heading? && sub_heading?
  end

  def sub_heading?
    parent_heading.present?
  end

  def parent_heading?
    sub_headings.present?
  end

  def items
    pages + electoral_races + sub_headings
  end

  def friendly_path
    url
  end

  def self.parent_navigation_headings
    where(navigation_heading_id: nil).order(:display_order)
  end
end
