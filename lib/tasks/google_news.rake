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
     rss_articles = NewsMention.gnews_search_for(person.name)

     Rails.logger.info "Looking for mentions of #{person.name}."
     Rails.logger.info "  !! #{rss_articles.count} Articles Found !!"

      mention_count = 0
      rss_articles.each do |rss_article|
        begin
          current_article = NewsArticle.find_or_create_by_url(rss_article.except(:summary, :source))
        rescue Exception => e
          raise e
        else
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
          # auto approve articles that mention more than one candidate.
          # Rails.logger.info "#{current_article.title} Mentions: #{current_article.news_mentions.size}"
          if current_article.moderation == 'new' && current_article.news_mentions.size > 1
            current_article.moderation = 'approved'
            current_article.save
            auto_approved += 1
          end
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
      # if (Rails.env == 'development')
        Rails.logger = Logger.new(STDOUT)
      #else
      #  Rails.logger.auto_flushing = true
      #end
    end
  end

end
