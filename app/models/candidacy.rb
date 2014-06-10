class Candidacy < ActiveRecord::Base
  belongs_to :electoral_race, inverse_of: :candidacies
  belongs_to :person, inverse_of: :candidacies

  has_many :regions, through: :electoral_race
  has_many :elections, through: :electoral_race

  validates :electoral_race, :person, presence: true

  def name_with_electoral_race
    person_name = person.nil? ? 'unknown candidate' : person.name
    "#{person_name} - #{electoral_race_name}"
  end

  def electoral_race_name
    electoral_race.nil? ? 'unknown electoral race' : electoral_race.name
  end
end
