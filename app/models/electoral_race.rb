class ElectoralRace < ActiveRecord::Base
  belongs_to :navigation_heading, inverse_of: :electoral_races
  belongs_to :region, inverse_of: :electoral_races
  belongs_to :election, inverse_of: :electoral_races

  has_many :candidacies, inverse_of: :electoral_race
  has_many :people, through: :candidacies

  validates :region, :election, presence: true

  delegate :year, to: :election, allow_nil: true
  delegate :name, to: :election, prefix: true
  delegate :region_type_name, to: :region, allow_nil: true
  delegate :name_with_parent, to: :region, prefix: true
  delegate :name_with_parent_and_type, to: :region, prefix: true, allow_nil: true
  delegate :name, to: :region, prefix: true

  def name_with_type_parent_and_year
    "#{region_name_with_parent_and_type} - #{year}"
  end
  alias_method :name, :name_with_type_parent_and_year

  include ActionView::Helpers::TextHelper
  def candidates_and_seats_message
    seats_phrase = if seats_to_fill == 1
                     ''
                   else
                     "competing for #{pluralize seats_to_fill, 'seat'} "
                   end
    are_or_is = candidacies.size == 1 ? 'is' : 'are'
    "There #{are_or_is} #{pluralize candidacies.size, 'candidate'}" \
    " #{seats_phrase}in this race."
  end

  def in_active_election?
    election.is_active?
  end

  def as_json(_options)
    super include: [:region,
                    candidacies: { include: { person: { methods: :friendly_path } } }],
          methods: :friendly_path
  end

  include FriendlyURL
  def slug_for_friendly_url
    name_with_type_parent_and_year.parameterize
  end
end
