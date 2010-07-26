class NewsArticlesController < ApplicationController
  def index
    @news_articles = NewsArticle.all
  end
  
  def show
    @news_article = NewsArticle.find(params[:id], :include => :candidates)
  end
  
  def new
    @news_article = NewsArticle.new
  end
  
  def create
    @news_article = NewsArticle.new(params[:news_article])
    if @news_article.save
      flash[:notice] = "Successfully created news article."
      redirect_to @news_article
    else
      render :action => 'new'
    end
  end
  
  def edit
    @news_article = NewsArticle.find(params[:id], :include => :candidates)
  end
  
  def update
    params[:news_article][:candidate_ids] ||= []
    @news_article = NewsArticle.find(params[:id], :include => :candidates)
    if @news_article.update_attributes(params[:news_article])
      flash[:notice] = "Successfully updated news article."
      redirect_to @news_article
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @news_article = NewsArticle.find(params[:id])
    @news_article.destroy
    flash[:notice] = "Successfully destroyed news article."
    redirect_to news_articles_url
  end
end
