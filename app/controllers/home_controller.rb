class HomeController < ApplicationController
  caches_page :index

  def index
    @mayoral_race = active_election.electoral_races
                                   .select('electoral_races.id, regions.name')
                                   .includes(region: :region_type)
                                   .where(region_types: { name: 'Mayoral' })
                                   .first
    @latest_news_articles = NewsArticle.approved.most_recent
    @council_map = ImageMap.find_by(name: 'City Council')
    @trustee_map = ImageMap.find_by(name: 'School Trustee')
  end
end
