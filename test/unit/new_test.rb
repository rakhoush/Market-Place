require 'test_helper'

class NewTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert New.new.valid?
  end
end
