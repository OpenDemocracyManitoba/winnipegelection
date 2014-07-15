ActiveAdmin.register NewsArticle do
  permit_params :title, :publication_date, :url, :moderation, :rejection_reason, :news_source_id

  scope :all, default: true
  scope :pending do |news_articles|
    news_articles.pending
  end
  scope :approved do |news_articles|
    news_articles.approved
  end
  scope :rejected do |news_articles|
    news_articles.rejected
  end

  batch_action :destroy, false

  batch_action :pend do |selection|
    NewsArticle.find(selection).each do |news_article|
      news_article.moderation = 'pending'
      news_article.save
    end
    redirect_to :back
  end

  batch_action :reject do |selection|
    NewsArticle.find(selection).each do |news_article|
      news_article.moderation = 'rejected'
      news_article.save
    end
    redirect_to :back
  end

  batch_action :approve do |selection|
    NewsArticle.find(selection).each do |news_article|
      news_article.moderation = 'approved'
      news_article.save
    end
    redirect_to :back
  end



  controller do
    def change_moderation
      @news_article = NewsArticle.find(params[:id])
      @news_article.moderation = params[:moderation]
      @news_article.save
      @pending_count = NewsArticle.pending.count
      @approved_count = NewsArticle.approved.count
      @rejected_count = NewsArticle.rejected.count

      respond_to do |format|
        format.js
      end
    end
  end

  index do
    selectable_column
    column :id
    column :title
    column :url do |news_article|
      link_to truncate(news_article.url), news_article.url
    end
    column :moderation
    column :moderate do |news_article|
      reject  = link_to 'Reject', admin_change_moderation_path(id: news_article.id, moderation: 'rejected'), method: :patch, remote: true
      pending = link_to 'Pending', admin_change_moderation_path(id: news_article.id, moderation: 'pending'), method: :patch, remote: true
      approve = link_to 'Approve', admin_change_moderation_path(id: news_article.id, moderation: 'approved'), method: :patch, remote: true
      "#{pending} #{reject} #{approve}".html_safe
    end

    column :mentions do |news_article|
      news_article.news_mentions.map{ |m| m.person.name }.join(', ')
    end
    column :publication_date
    column :created_at
    actions defaults: true
  end
end
