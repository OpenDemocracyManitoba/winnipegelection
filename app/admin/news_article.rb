ActiveAdmin.register NewsArticle do
  permit_params :title, :publication_date, :url, :moderation, :rejection_reason, :news_source_id

  scope :all, default: true
  scope :new do |news_articles|
    news_articles.where(moderation: 'new')
  end
  scope :approved do |news_articles|
    news_articles.where(moderation: 'approved')
  end
  scope :rejected do |news_articles|
    news_articles.where(moderation: 'rejected')
  end

  controller do
    def change_moderation
      @news_article = NewsArticle.find(params[:id])
      @news_article.moderation = params[:moderation]
      @news_article.save

      respond_to do |format|
        format.js
      end
    end
  end

  index do
    column :id
    column :title
    column :url do |news_article|
      link_to truncate(news_article.url), news_article.url
    end
    column :moderation 
    column :moderate do |news_article|
      reject  = link_to 'Reject', admin_change_moderation_path(id: news_article.id, moderation: 'rejected'), method: :patch, remote: true
      new     = link_to 'New', admin_change_moderation_path(id: news_article.id, moderation: 'new'), method: :patch, remote: true
      approve = link_to 'Approve', admin_change_moderation_path(id: news_article.id, moderation: 'approved'), method: :patch, remote: true
      "#{new} #{reject} #{approve}".html_safe
    end

    column :mentions do |news_article|
      news_article.news_mentions.map{ |m| m.person.name }.join(', ')
    end
    column :publication_date
    column :created_at
    actions defaults: true 
  end
end
