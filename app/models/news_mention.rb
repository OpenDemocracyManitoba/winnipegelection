class NewsMention < ActiveRecord::Base
  belongs_to :person, inverse_of: :news_mentions
  belongs_to :news_article, inverse_of: :news_mentions

  validates :person, :news_article, presence: true

  def self.gnews_search_for(name, alternative_name, location = false)
    query = "\"#{name}\""
    query += " OR \"#{alternative_name}\""  unless alternative_name.blank?

    gnews_url = 'http://news.google.ca/news?ned=ca&hl=en&as_drrb=q' \
                '&as_qdr=a&scoring=r&output=rss&num=75' \
                "&q=#{URI.escape(query)}"
    gnews_url += "&geo=#{location}"  if location

    cfeed_raw = FeedNormalizer::FeedNormalizer.parse(open(gnews_url))
    feed = []

    cfeed_raw.entries.each do |entry_raw|
      entry                    = {}
      title_elements           = entry_raw.title.split('-')
      entry[:source]           = title_elements.pop
      entry[:title]            = title_elements.join
      entry[:publication_date] = entry_raw.date_published
      description              = Nokogiri::HTML.fragment(entry_raw.description)
      summary                  = description.xpath('.//font[@size=-1]')
      entry[:summary]          = summary[1].inner_html
      url                      = entry_raw.urls[0].split('url=')[1]
      entry[:url]              = URI.unescape(url)
      entry[:base_url]         = URI.join(url, '/').to_s.chop
      entry[:moderation]       = 'pending'
      feed << entry
    end

    feed
  end
end
