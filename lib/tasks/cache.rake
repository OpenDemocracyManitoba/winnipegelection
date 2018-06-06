namespace :cache do
  desc "Visit all pages we which to seed to the public folder file cache."
  task :seed => :environment do
    require 'open-uri'
    BASE_URL = 'http://winnipegelection.ca'

    def visit_route(current_route)
      to_visit = BASE_URL + current_route
      print to_visit
      # io = open(to_visit)
      # print " ! Coule not open #{to_visit}" unless io.status.first == '200'
      puts
    end

    def visit_pagination(current_route, scope)
      page_count = scope.page.total_pages
      (2..page_count).each { |i| visit_route("#{current_route}/page/#{i}") }
    end

    # / - Home Page
    visit_route('/')

    # /pages/:id/:slug - Many: All CMS Pages
    Page.all.each do |page|
      visit_route("/pages/#{page.id}/#{page.slug_for_friendly_url}")
    end

    # /issue_websites - One page
    visit_route('/issue_websites')

    # /news_articles(/page/:page) - Paginated News Articles
    visit_route('/news_articles')
    visit_pagination('/news_articles',NewsArticle.approved)

    # /image_maps/:id/:slug - Just two: Council, Trustee
    ImageMap.all.each do |image_map|
      visit_route("/image_maps/#{image_map.id}/#{image_map.slug_for_friendly_url}")
      # /electoral_races/school_trustee - All trustees candidates on One Page
      # /electoral_races/council - All councillor candidates on One Page
      visit_route(image_map.all_candidates_url)
    end

    # /electoral_races/:id/:slug(/page/:page) - Many: Mayoral, All Council, All Trustee
    Election.active_election.electoral_races.each do |electoral_race|
      route = "/electoral_races/#{electoral_race.id}/#{electoral_race.slug_for_friendly_url}"
      visit_route(route)
      if electoral_race.latest_news.present?
        visit_pagination(route, electoral_race.latest_news)
      end

      # /people/:id/:slug(/page/:page) - Many: All Candidates, Paginated on News Mentions
      electoral_race.candidacies.each do |candidacy|
        person = candidacy.person
        route = "/people/#{person.id}/#{person.slug_for_friendly_url}"
        visit_route(route)
        if person.approved_news_mentions.present?
          visit_pagination(route, person.approved_news_mentions)
        end
      end
    end


  end
end
