require 'test_helper'

class SchoolWardsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => SchoolWard.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    SchoolWard.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    SchoolWard.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to school_ward_url(assigns(:school_ward))
  end
  
  def test_edit
    get :edit, :id => SchoolWard.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    SchoolWard.any_instance.stubs(:valid?).returns(false)
    put :update, :id => SchoolWard.first
    assert_template 'edit'
  end
  
  def test_update_valid
    SchoolWard.any_instance.stubs(:valid?).returns(true)
    put :update, :id => SchoolWard.first
    assert_redirected_to school_ward_url(assigns(:school_ward))
  end
  
  def test_destroy
    school_ward = SchoolWard.first
    delete :destroy, :id => school_ward
    assert_redirected_to school_wards_url
    assert !SchoolWard.exists?(school_ward.id)
  end
end
