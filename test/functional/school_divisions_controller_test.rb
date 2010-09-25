require 'test_helper'

class SchoolDivisionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => SchoolDivision.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    SchoolDivision.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    SchoolDivision.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to school_division_url(assigns(:school_division))
  end
  
  def test_edit
    get :edit, :id => SchoolDivision.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    SchoolDivision.any_instance.stubs(:valid?).returns(false)
    put :update, :id => SchoolDivision.first
    assert_template 'edit'
  end
  
  def test_update_valid
    SchoolDivision.any_instance.stubs(:valid?).returns(true)
    put :update, :id => SchoolDivision.first
    assert_redirected_to school_division_url(assigns(:school_division))
  end
  
  def test_destroy
    school_division = SchoolDivision.first
    delete :destroy, :id => school_division
    assert_redirected_to school_divisions_url
    assert !SchoolDivision.exists?(school_division.id)
  end
end
