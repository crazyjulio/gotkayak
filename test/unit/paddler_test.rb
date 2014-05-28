require 'test_helper'

class PaddlerTest < ActiveSupport::TestCase
  test "image_limit" do
    assert_equal(1, Paddler.image_limit)
  end
end
