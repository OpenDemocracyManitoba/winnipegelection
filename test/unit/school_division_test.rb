require 'test_helper'

class SchoolDivisionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert SchoolDivision.new.valid?
  end
end
