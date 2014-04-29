class Candidacy < ActiveRecord::Base
  belongs_to :electoral_race, inverse_of: :candidacies
  belongs_to :person, inverse_of: :candidacies

  has_many :regions, through: :electoral_race
  has_many :elections, through: :electoral_race

  validates :electoral_race, :person, presence: true
  
  def name
    "#{person.name} - #{electoral_race.name}"
  end
end
