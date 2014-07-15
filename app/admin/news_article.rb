ActiveAdmin.register NewsArticle do
  permit_params :title, :publication_date, :url, :moderation, :rejection_reason, :news_source_id
end
