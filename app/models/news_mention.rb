class NewsMention < ActiveRecord::Base
  belongs_to :person, inverse_of: :news_mentions
  belongs_to :news_article, inverse_of: :news_mentions

  validates :person, :news_article, presence: true

  GOOGLE_NEWS_URL_1 = 'http://news.google.ca/news?pz=1&cf=all&ned=ca&hl=en&as_maxm=3&q='
  GOOGLE_NEWS_URL_2 = '&as_qdr=a&as_drrb=q&as_mind=25&as_minm=2&cf=all&as_maxd=27&scoring=r&output=rss&num=50'
  def self.gnews_search_for(name)
    # query = URI.escape('"' + name + '"' + ' location:winnipeg')
    query = URI.escape(name + ' location:winnipeg')
    puts query
    find_url = GOOGLE_NEWS_URL_1 + query + GOOGLE_NEWS_URL_2
    puts find_url
    cfeed_raw = FeedNormalizer::FeedNormalizer.parse open(find_url)
    feed = []

    cfeed_raw.entries.each do |entry_raw|
      entry = {}
      title_elements = entry_raw.title.split('-')
      entry[:source] = title_elements.pop
      entry[:title] = (title_elements).join
      entry[:publication_date] = entry_raw.date_published
      description = Nokogiri::HTML::fragment(entry_raw.description)
      summary = description.xpath('.//font[@size=-1]')
      entry[:summary] = summary[1].inner_html
      #entry[:google_news_url] = entry_raw.urls[0]
      entry[:url] = URI.unescape(entry_raw.urls[0].split('url=')[1])
      entry[:moderation] = 'approved'
      feed << entry
    end

    feed
  end
end
