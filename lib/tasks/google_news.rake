namespace :gnews do
  task :find_mentions => :environment do
    require 'open-uri'

    init_logger

    start = Time.now

    people = Person.includes(candidacies: { electoral_race: :election })
                   .where(elections: { is_active: true })

    total_mentions = 0
    auto_approved = 0

    people.each do |person|
     rss_articles = NewsMention.gnews_search_for(person.name, 
                                                 person.also_known_as,
                                                 'winnipeg')
     rss_articles += NewsMention.gnews_search_for(person.name, 
                                                 person.also_known_as)

     Rails.logger.info "Looking for mentions of #{person.name}."
     Rails.logger.info "  !! #{rss_articles.count} Articles Found !!"

      mention_count = 0
      rss_articles.each do |rss_article|
        current_news_source = NewsSource.find_or_create_by_name({ name: rss_article[:source],
                                                                  base_url: rss_article[:base_url],
                                                                  is_local_source: false })
        
        next  if current_news_source.is_local_source === false
        rss_article[:news_source] = current_news_source
        current_article = NewsArticle.find_or_create_by_url(rss_article.except(:summary, :source, :base_url))

        if !current_article.people.include?(person)
          mention_count += 1
          total_mentions += 1
          mention = NewsMention.new(person: person,
                                news_article: current_article,
                                summary: rss_article[:summary])
          if !mention.save
           Rails.logger.error "news error: mention for #{current_article.title} did not save"
          end
        end

        if (current_article.moderation =='pending' && 
           current_news_source.is_local_source &&
           current_article.news_mentions.size > 1)
          current_article.moderation = 'approved'
          current_article.save
          auto_approved += 1
        end
      end
      Rails.logger.info "  !! #{mention_count} new mentions. !!" unless mention_count.zero?
    end

    Rails.logger.info "Total New Mentions: #{total_mentions}"
    Rails.logger.info "Auto-Approved Articles: #{auto_approved}"
    Rails.logger.info "News Scrape Seconds: #{Time.now - start}"
  end

  def init_logger
    if defined?(Rails)
      Rails.logger = Logger.new(STDOUT)
    end
  end

end
