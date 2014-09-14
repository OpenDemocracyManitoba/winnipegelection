# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news_mention do
    summary 'MyText'
    person nil
    news_article nil
  end
end
