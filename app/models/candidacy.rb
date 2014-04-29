class Candidacy < ActiveRecord::Base
  belongs_to :electoral_race, inverse_of: :candidacies
  belongs_to :person, inverse_of: :candidacies

  has_many :regions, through: :electoral_race

  validates :electoral_race, :person, presence: true
end
