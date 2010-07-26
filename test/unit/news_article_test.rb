require 'test_helper'

class NewsArticleTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert NewsArticle.new.valid?
  end
end
