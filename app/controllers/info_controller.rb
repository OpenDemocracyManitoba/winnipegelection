class InfoController < ApplicationController
  
  def index
    @days_until_election = Date.parse("2010 October 27") - Date.today
  end
  def mayor
    @ward = Ward.first(:include => :candidates, :conditions => "ward_type = 'Mayoral'")
    @title = 'Winnipeg Mayoral Candidates'
  end
  def council
    @wards = Ward.all(:include => :candidates, :conditions => "ward_type = 'Civic'")
    @title = 'Winnipeg City Councillor Candidates'
    @wards_title = 'All Electoral Wards'
  end
  def school_trustee
    @wards = Ward.all(:include => :candidates, :conditions => "ward_type = 'School Division'")
    @title = 'Winnipeg School Trustee Candidates'
    @wards_title = 'All School Divisions'
  end
  def ward
    @ward_name = params[:ward_name].sub(/^St/,'St.').gsub('_',' ')
    @ward = Ward.first( :conditions => ["name = ?", @ward_name] )
  end
end
