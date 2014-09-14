class ElectionsController < ApplicationController
  def show
    @election = Election.includes(:electoral_races).find(params[:id])
    respond_to do |format|
      format.json {
        render json: @election,
               include: [electoral_races:
                           { include: [region: { include: :region_type }] }]
      }
    end
  end
end
