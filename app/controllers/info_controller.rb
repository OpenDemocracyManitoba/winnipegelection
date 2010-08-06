GOOGLE_NEWS_URL_1 = 'http://news.google.ca/news?pz=1&cf=all&ned=ca&hl=en&as_maxm=3&q='
GOOGLE_NEWS_URL_2 = '&as_qdr=a&as_drrb=q&as_mind=25&as_minm=2&cf=all&as_maxd=27&scoring=n&output=rss'

class InfoController < ApplicationController
  before_filter :authenticate, :only => :news
  
  def index
    @days_until_election = Date.parse("2010 October 27") - Date.today
    @meta_description = "Get to know your mayoral, city council and school trustee candidates for the upcoming Winnipeg civic election."
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
    @ward_name = Ward.url_to_ward(params[:ward_name])
    @ward = Ward.first( :conditions => ["name = ?", @ward_name] )
  end
  def news
    @candidates = Candidate.with_approved_articles
  end
  def latest_news
    redirect_to latest_news_articles_path
  end
  def incumbents
    @title = 'Incumbents'
    @mayor = Candidate.first( :include => :ward, :conditions => "incumbent_since IS NOT NULL AND wards.ward_type = 'Mayoral'" )
    @incumbents = Candidate.all( :include => :ward, :conditions => "incumbent_since IS NOT NULL AND wards.ward_type ='Civic'", :order => Candidate.db_random)
  end
end
