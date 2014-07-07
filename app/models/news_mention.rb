class NewsMention < ActiveRecord::Base
  belongs_to :person
  belongs_to :news_article
end
