class InfoController < ApplicationController
  def wards
    @wards = Ward.all(:include => :candidates)
  end
  def councillors
    @wards = Ward.all(:include => :candidates, :conditions => "name != 'Mayoral'")
    @title = 'Winnipeg City Councillor Candidates'
  end
  def mayoral
    @ward = Ward.first(:include => :candidates, :conditions => "name == 'Mayoral'")
    @title = 'Winnipeg Mayoral Candidates'
  end
  def ward
    @ward_name = params[:ward_name].sub(/^St/,'St.').gsub('_',' ')
    @ward = Ward.first( :conditions => ["name = ?", @ward_name] )
  end
end
