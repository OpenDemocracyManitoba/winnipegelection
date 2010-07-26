class InfoController < ApplicationController
  
  def index
    @days_until_election = Date.parse("2010 October 27") - Date.today
  end
  def mayor
    @show_feedback = true
    @ward = Ward.first(:include => :candidates, :conditions => "ward_type = 'Mayoral'")
    @title = 'Mayoral Candidates'
  end
  def council
    @show_feedback = true
    @wards = Ward.all(:include => :candidates, :conditions => "ward_type = 'Civic'")
    @title = 'City Councillor Candidates'
    @wards_title = 'All Electoral Wards'
  end
  def school_trustee
    @show_feedback = true
    @wards = Ward.all(:include => :candidates, :conditions => "ward_type = 'School Division'")
    @title = 'School Trustee Candidates'
    @wards_title = 'All School Divisions'
  end
  def ward
    @show_feedback = true
    @ward_name = params[:ward_name].sub(/^St/,'St.').gsub('_',' ')
    @ward = Ward.first( :conditions => ["name = ?", @ward_name] )
  end
end
