class ElectoralRace < ActiveRecord::Base
  belongs_to :region, inverse_of: :electoral_races
  belongs_to :election, inverse_of: :electoral_races

  has_many :candidacies, inverse_of: :electoral_race
  has_many :people, through: :candidacies

  validates :region, :election, presence: true

  def name
    region_name = region.nil? ? 'unknown region' : region.name_with_type
    year = election.nil? ? 'unknown election' : election.election_date.year
    "#{region_name} - #{year}"
  end

  include FriendlyURL
  def slug_for_friendly_url
    name.parameterize
  end
end
