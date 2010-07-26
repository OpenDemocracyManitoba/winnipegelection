require 'test_helper'

class NewsArticlesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => NewsArticle.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    NewsArticle.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    NewsArticle.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to news_article_url(assigns(:news_article))
  end
  
  def test_edit
    get :edit, :id => NewsArticle.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    NewsArticle.any_instance.stubs(:valid?).returns(false)
    put :update, :id => NewsArticle.first
    assert_template 'edit'
  end
  
  def test_update_valid
    NewsArticle.any_instance.stubs(:valid?).returns(true)
    put :update, :id => NewsArticle.first
    assert_redirected_to news_article_url(assigns(:news_article))
  end
  
  def test_destroy
    news_article = NewsArticle.first
    delete :destroy, :id => news_article
    assert_redirected_to news_articles_url
    assert !NewsArticle.exists?(news_article.id)
  end
end
