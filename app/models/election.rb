class Election < ActiveRecord::Base
  has_many :electoral_races, inverse_of: :election
  has_many :regions, through: :electoral_races

  validates :name, presence: true
end
