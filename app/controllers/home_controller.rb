class HomeController < ApplicationController
  def index
    @mayoral_race = active_election.electoral_races
                                   .includes(region: :region_type)
                                   .where(region_types: { name: 'Mayoral' })
                                   .first
    @latest_news_articles = NewsArticle.approved.most_recent
  end
end
