class InfoController < ApplicationController
  def wards
    @wards = Ward.all(:include => :candidates)
  end
end
