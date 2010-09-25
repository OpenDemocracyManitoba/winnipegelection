require 'test_helper'

class SchoolWardTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert SchoolWard.new.valid?
  end
end
