namespace :gnews do
  task :find_candidates => :environment do
    require 'open-uri'
    require 'pp'
    candidates = Candidate.all
    
    for candidate in candidates do
      puts "Looking for mentions of #{candidate.name}."
      articles = Mention.gnews_search_for candidate.name
      puts "  #{articles.size} Articles."
      mention_count = 0
      for article in articles do
        begin
          current_article = NewsArticle.find_or_create_by_url(article)
        rescue Exception
          puts "Unable to find or create: "
          pp article
        else
          if !current_article.candidates.include?(candidate)
            mention_count += 1
            mention = Mention.new(:candidate => candidate, :news_article => current_article, :summary => article[:summary])
            puts "    Error saving mention for #{current_article.title}." if !mention.save
          end
        end
      end
      puts "  !! #{mention_count} New Mentions. !!" if mention_count != 0
    end
    puts
  end
end
