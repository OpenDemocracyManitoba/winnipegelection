class Mention < ActiveRecord::Base
  GOOGLE_NEWS_URL_1 = 'http://news.google.ca/news?pz=1&cf=all&ned=ca&hl=en&as_maxm=3&q='
  GOOGLE_NEWS_URL_2 = '&as_qdr=a&as_drrb=q&as_mind=25&as_minm=2&cf=all&as_maxd=27&scoring=n&output=rss&num=50'
  
  belongs_to :candidate
  belongs_to :news_article
  
  named_scope :with_related_approved_news, :include => {:news_article => [:mentions => [:candidate]]}, :order => 'news_articles.pubdate DESC', :conditions =>  "news_articles.moderation ='approved'"
  named_scope :by_name, lambda { |id|
    {:conditions => ["mentions.candidate_id = ?", id]}
  }
  named_scope :recent, :limit => 15
  
  def self.gnews_search_for(candidate)
    
    query = URI.escape('"' + candidate +'"' + ' location:manitoba')
    find_url = GOOGLE_NEWS_URL_1 + query + GOOGLE_NEWS_URL_2
    cfeed_raw = FeedNormalizer::FeedNormalizer.parse open(find_url)
    feed = []
    
    cfeed_raw.entries.each do |entry_raw|
      entry = {}
      title_elements = entry_raw.title.split('-')
      entry[:source] = title_elements.pop
      entry[:title] = (title_elements).join
      entry[:pubdate] = entry_raw.date_published
      description = Nokogiri::HTML::fragment(entry_raw.description)
      summary = description.xpath('.//font[@size=-1]')
      entry[:summary] = summary[1].inner_html
      entry[:gnews_url] = entry_raw.urls[0]
      entry[:url] = entry_raw.urls[0].split('url=')[1]
      feed << entry if entry[:summary].include? candidate
    end
    
    feed
    
  end
  
end
