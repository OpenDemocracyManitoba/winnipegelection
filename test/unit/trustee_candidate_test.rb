require 'test_helper'

class TrusteeCandidateTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert TrusteeCandidate.new.valid?
  end
end
