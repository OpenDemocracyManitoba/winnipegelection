class NewsArticlesController < ApplicationController
  caches_page :index

  def index
    @latest_news_articles = NewsArticle.approved
                                       .reverse_chronological
                                       .page(params[:page])
  end
end
