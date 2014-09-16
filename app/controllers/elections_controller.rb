class ElectionsController < ApplicationController
  def show
    @election = Election.includes(:electoral_races).find(params[:id])
    respond_to do |format|
      format.json { render json: @election }
    end
  end
end
