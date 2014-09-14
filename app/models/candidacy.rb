class Candidacy < ActiveRecord::Base
  belongs_to :electoral_race, inverse_of: :candidacies
  belongs_to :person, inverse_of: :candidacies

  has_many :regions, through: :electoral_race
  has_many :elections, through: :electoral_race

  validates :electoral_race, :person, presence: true

  delegate :year, to: :electoral_race, prefix: true
  delegate :region_type_name, to: :electoral_race, prefix: true
  delegate :name, to: :electoral_race, prefix: true
  delegate :region_name_with_parent, to: :electoral_race, prefix: true
  delegate :name, to: :person, prefix: true, allow_nil: true

  def person_name_with_electoral_race
    "#{person_name} - #{electoral_race_name}"
  end

  def formal_race_description
    "#{electoral_race_year} #{electoral_race_region_name_with_parent} " \
    "#{electoral_race_region_type_name} race"
  end
end
