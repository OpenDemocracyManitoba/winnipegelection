class ElectoralRacesController < ApplicationController
  def council
    @electoral_races = active_council_races_order_by_region_name
  end

  def school_trustee
    @electoral_races = active_school_trustee_races_order_by_region_name
  end

  def show
    @electoral_race = ElectoralRace.friendly_find(params)
  end
end
