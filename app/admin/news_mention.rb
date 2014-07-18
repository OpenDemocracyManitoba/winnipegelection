ActiveAdmin.register NewsMention do
  permit_params :summary, :person_id, :news_article_id
end
