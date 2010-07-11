require 'test_helper'

class WardsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Ward.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Ward.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Ward.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to ward_url(assigns(:ward))
  end
  
  def test_edit
    get :edit, :id => Ward.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Ward.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Ward.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Ward.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Ward.first
    assert_redirected_to ward_url(assigns(:ward))
  end
  
  def test_destroy
    ward = Ward.first
    delete :destroy, :id => ward
    assert_redirected_to wards_url
    assert !Ward.exists?(ward.id)
  end
end
