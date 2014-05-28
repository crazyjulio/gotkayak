require 'test_helper'

class FeatureTest < ActiveSupport::TestCase
  test "deleting a feature should also delete its record in the version_features table" do
    @feature = features(:one)

    assert_difference('VersionFeature.count', -1) do
      @feature.destroy
    end
  end
end
