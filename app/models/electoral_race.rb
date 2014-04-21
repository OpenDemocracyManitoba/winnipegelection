class ElectoralRace < ActiveRecord::Base
  belongs_to :region
  belongs_to :election
end
