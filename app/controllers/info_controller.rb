class InfoController < ApplicationController
  def wards
    @wards = Ward.all(:include => :candidates)
  end
  def councillors
    @wards = Ward.all(:include => :candidates)
    @title = 'City Councillors'
    render :partial => 'ward', :layout => 'application'
  end
end
