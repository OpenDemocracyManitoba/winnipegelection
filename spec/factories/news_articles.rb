# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news_article do
    title 'MyString'
    publication_date '2014-07-07 13:31:52'
    google_news_url 'MyString'
    url 'MyString'
    moderation 'MyString'
    rejection_reason 'MyText'
    news_source nil
  end
end
