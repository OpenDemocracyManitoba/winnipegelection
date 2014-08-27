class ElectoralRace < ActiveRecord::Base
  belongs_to :navigation_heading, inverse_of: :electoral_races
  belongs_to :region, inverse_of: :electoral_races
  belongs_to :election, inverse_of: :electoral_races

  has_many :candidacies, inverse_of: :electoral_race
  has_many :people, through: :candidacies

  validates :region, :election, presence: true

  NO_REGISTERED_CANDIDATES = 'There are no registered candidates in this' \
                             'electoral race.'
  CANDIDATES_RANDOMIZED = 'Candidates are displayed in random order.'

  def region_name_with_type
    region.nil? ? 'unknown region' : region.name_with_type
  end

  delegate :year, to: :election, allow_nil: true
  delegate :region_type_name, to: :region, allow_nil: true
  delegate :name_with_parent, to: :region, prefix: true
  delegate :name, to: :region, prefix: true

  def name_with_type_and_year
    "#{region_name_with_type} - #{year}"
  end
  alias_method :name, :name_with_type_and_year

  def name
    name_with_type_and_year
  end

  def candidacy_order_message
    candidacies.empty? ? NO_REGISTERED_CANDIDATES : CANDIDATES_RANDOMIZED
  end

  include FriendlyURL
  def slug_for_friendly_url
    name_with_type_and_year.parameterize
  end
end
