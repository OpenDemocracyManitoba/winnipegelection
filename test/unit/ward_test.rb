require 'test_helper'

class WardTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Ward.new.valid?
  end
end
