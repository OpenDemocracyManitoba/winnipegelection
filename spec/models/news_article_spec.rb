require 'spec_helper'

describe NewsArticle do
  describe '#pretty_date' do
    let(:news_article) { news_articles(:vadar_alone_in_mayoral_race) }
    it 'should properly format the date' do
      news_article.publication_date = DateTime.parse('17 July 2014')
      expect(news_article.pretty_date).to eq('Thursday, 17 July 2014')
    end
  end
end
