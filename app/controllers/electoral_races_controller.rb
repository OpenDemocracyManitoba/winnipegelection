class ElectoralRacesController < ApplicationController
  def council
    @electoral_races = active_council_races_order_by_region_name
    respond_to do |format|
      format.html
      format.json {
        render json: @electoral_races,
               include: [:region, candidacies: { include: :person }]
      }
    end
  end

  def school_trustee
    @electoral_races = active_school_trustee_races_order_by_region_name
    respond_to do |format|
      format.html
      format.json {
        render json: @electoral_races,
               include: [:region, candidacies: { include: :person }]
      }
    end
  end

  def show
    @electoral_race = ElectoralRace.includes(candidacies: :person)
                                   .friendly_find(params)
  end

  def show_json
    @electoral_race = ElectoralRace.includes(candidacies: :person)
                                   .find(params[:id])
    render json: @electoral_race,
           include: [:region, candidacies: { include: :person }]
  end
end
