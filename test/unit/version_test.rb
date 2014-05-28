require 'test_helper'

class VersionTest < ActiveSupport::TestCase

  test "destroying a version should not destroy the product it belongs to" do
    @version = versions(:one)

    assert_no_difference('Product.count') do
      @version.destroy
    end
  end

  test "deleting a product should also delete its record in the version_features table" do
    @product = products(:one)

    assert_difference('VersionFeature.count', -2) do
      @product.destroy
    end
  end
end
