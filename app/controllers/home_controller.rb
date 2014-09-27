class HomeController < ApplicationController
  def index
    @mayoral_race = active_election.electoral_races
                                   .select('electoral_races.id, regions.name')
                                   .includes(region: :region_type)
                                   .where(region_types: { name: 'Mayoral' })
                                   .first
    @latest_news_articles = NewsArticle.approved.most_recent
    @council_map = ImageMap.select(:name, :id).find_by(name: 'City Council')
  end
end
