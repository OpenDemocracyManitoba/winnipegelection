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

  def election_year
    election.nil? ? 'unknown election' : election.year
  end

  def name
    "#{region_name_with_type} - #{election_year}"
  end

  def candidacy_order_message
    candidacies.empty? ? NO_REGISTERED_CANDIDATES : CANDIDATES_RANDOMIZED
  end

  include FriendlyURL
  def slug_for_friendly_url
    name.parameterize
  end
end
