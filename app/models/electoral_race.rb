class ElectoralRace < ActiveRecord::Base
  belongs_to :region, inverse_of: :electoral_races
  belongs_to :election, inverse_of: :electoral_races
  
  has_many :candidacies, inverse_of: :electoral_race
  has_many :people, through: :candidacies

  validates :region, :election, presence: true
end
