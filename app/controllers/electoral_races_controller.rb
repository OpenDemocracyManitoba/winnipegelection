class ElectoralRacesController < ApplicationController
  def council
    @electoral_races = active_election.electoral_races
                                      .includes(region: :region_type)
                                      .where(region_types:
                                             { name: 'Council Ward' })
                                      .order('regions.name')
  end

  def show
    @electoral_race = ElectoralRace.friendly_find(params)
  end
end
