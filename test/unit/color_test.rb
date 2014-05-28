require 'test_helper'

class ColorTest < ActiveSupport::TestCase
  test "deleting a color should also delete its record in the product_colors table" do
    @color = colors(:one)

    assert_difference('ProductColor.count', -1) do
      @color.destroy
    end
  end
end
