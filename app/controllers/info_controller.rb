GOOGLE_NEWS_URL_1 = 'http://news.google.ca/news?pz=1&cf=all&ned=ca&hl=en&as_maxm=3&q='
GOOGLE_NEWS_URL_2 = '&as_qdr=a&as_drrb=q&as_mind=25&as_minm=2&cf=all&as_maxd=27&scoring=n&output=rss'

class InfoController < ApplicationController
  def index
    @days_until_election = Date.parse("2010 October 27") - Date.today
    @meta_description = "Get to know your mayoral, city council and school trustee candidates for the upcoming Winnipeg civic election."
  end
  def mayor
    @show_feedback = true
    @ward = Ward.mayoral.with_candidates.first
    @title = 'Mayoral Candidates'
  end
  def council
    @show_feedback = true
    @wards = Ward.council.with_candidates.all(:order => 'wards.name')
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
    @ward = Ward.with_candidates.first( :conditions => ["wards.name = ?", @ward_name] )
  end
  def candidate
    @show_feedback = true
    @page_num = params[:page_id] || '1'
    
    @candidate_name = Candidate.url_to_candidate(params[:candidate_name])
    @title = @candidate_name
    @candidate = Candidate.by_name(@candidate_name).with_ward.first
    
    @mentions = Mention.with_related_approved_news.by_name(@candidate.id)
    @mentions.per_page = 10
    
    @current_mentions_page = @mentions.pages.find(@page_num)
    @current_mentions_page.paginator.set_path { |page| paged_candidate_path(page, params[:candidate_name]) + '#related_news' }
    @mentions_by_date = @current_mentions_page.mentions.group_by{ |mention| mention.news_article.pretty_date }
  end
  def incumbents
    @title = 'Incumbents'
    # Quicker here not to eager load the mentions 'cause we just need their count.
    # Is there any way to eager load an association count? I guess we could use counter caching.
    # Tried to use a :select to specify count, but they are ignored when using :include. Boo.
    @mayor = Candidate.incumbent.with_ward.first(:conditions => "wards.ward_type ='Mayoral'")
    @incumbents = Candidate.incumbent.with_ward.all(:conditions => "wards.ward_type ='Civic'", :order => Candidate.db_random)
  end
end
