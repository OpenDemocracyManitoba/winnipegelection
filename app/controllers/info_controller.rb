GOOGLE_NEWS_URL_1 = 'http://news.google.ca/news?pz=1&cf=all&ned=ca&hl=en&as_maxm=3&q='
GOOGLE_NEWS_URL_2 = '&as_qdr=a&as_drrb=q&as_mind=25&as_minm=2&cf=all&as_maxd=27&scoring=n&output=rss'

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
    @ward_name = Ward.url_to_ward(params[:ward_name])
    @ward = Ward.first( :conditions => ["name = ?", @ward_name] )
  end
  def news
    @candidates = Candidate.with_approved_articles
  end
  def latest_news
    @title = 'Latest Election News'
    @latest_news = NewsArticle.latest(20).approved.with_nested_candidates_and_wards
    @latest_news_by_day = @latest_news.group_by(&:pretty_date)
  end
end
