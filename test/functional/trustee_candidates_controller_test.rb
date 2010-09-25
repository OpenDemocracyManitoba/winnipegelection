require 'test_helper'

class TrusteeCandidatesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => TrusteeCandidate.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    TrusteeCandidate.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    TrusteeCandidate.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to trustee_candidate_url(assigns(:trustee_candidate))
  end
  
  def test_edit
    get :edit, :id => TrusteeCandidate.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    TrusteeCandidate.any_instance.stubs(:valid?).returns(false)
    put :update, :id => TrusteeCandidate.first
    assert_template 'edit'
  end
  
  def test_update_valid
    TrusteeCandidate.any_instance.stubs(:valid?).returns(true)
    put :update, :id => TrusteeCandidate.first
    assert_redirected_to trustee_candidate_url(assigns(:trustee_candidate))
  end
  
  def test_destroy
    trustee_candidate = TrusteeCandidate.first
    delete :destroy, :id => trustee_candidate
    assert_redirected_to trustee_candidates_url
    assert !TrusteeCandidate.exists?(trustee_candidate.id)
  end
end
