require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Candidate.new.valid?
  end
end
