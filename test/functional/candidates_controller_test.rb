require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Candidate.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Candidate.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Candidate.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to candidate_url(assigns(:candidate))
  end
  
  def test_edit
    get :edit, :id => Candidate.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Candidate.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Candidate.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Candidate.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Candidate.first
    assert_redirected_to candidate_url(assigns(:candidate))
  end
  
  def test_destroy
    candidate = Candidate.first
    delete :destroy, :id => candidate
    assert_redirected_to candidates_url
    assert !Candidate.exists?(candidate.id)
  end
end
