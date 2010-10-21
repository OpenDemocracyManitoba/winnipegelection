class PressResourcesController < ApplicationController
  
  before_filter :authenticate_press
  
  def candidate_photos
    @council_wards = Ward.council.with_candidates.all
    @mayoral_ward = Ward.mayoral.with_candidates.first
  end

end
