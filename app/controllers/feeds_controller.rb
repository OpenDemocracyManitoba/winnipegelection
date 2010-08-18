class FeedsController < ApplicationController
  def candidate
    @candidate_name = Candidate.url_to_candidate(params[:candidate_name])
    @candidate = Candidate.by_name(@candidate_name).with_ward.first
    @mentions = Mention.with_related_approved_news.by_name(@candidate.id).recent
    @mentions_by_date = @mentions.group_by{ |mention| mention.news_article.pretty_date }
    @title = "Articles that Mention #{@candidate_name}"
    @updated = @mentions.first.news_article.pubdate unless @mentions.empty?
  end
  def ward
    @ward_name = Ward.url_to_ward(params[:ward_name])
    @ward = Ward.first( :include => :candidates, :conditions => ["wards.name = ?", @ward_name] )
    @mentions = Mention.all( :select => "mentions.news_article_id", :conditions => ["candidate_id IN (?)",@ward.candidates] )
    @news_articles = NewsArticle.all( :include => {:mentions => [:candidate]}, :conditions => ["id IN (#{@mentions.map(&:news_article_id).join(",")})"], :order => "pubdate DESC", :limit => 15)
    @title = "Articles that Mention #{@ward_name} Candidates"
    @updated = @news_articles.first.pubdate unless @news_articles.empty?
  end
  def latest_news
     @news_articles = NewsArticle.all( :include => {:mentions => [:candidate]}, :order => "pubdate DESC", :limit => 15 )
     @title = "Articles that Mention Winnipeg Election Candidates"
     @updated = @news_articles.first.pubdate unless @news_articles.empty?
  end
end
