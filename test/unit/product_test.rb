require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "full_name should return a string with manufacturer name and product name" do
    @product = products(:one)

    assert_equal("Malibu X Factor", @product.full_name)
  end

  test "deleting a product should also delete its record in the product_colors table" do
    @product = products(:one)

    assert_difference('ProductColor.count', -2) do
      @product.destroy
    end
  end

  test "deleting a product should also delete its versions" do
    @product = products(:one)

    assert_difference('Version.count',-1) do
      @product.destroy
    end
  end


  test "deleting a product should also delete its clearance items" do
    @product = products(:one)
    assert_difference('ClearanceItem.count',-3) do
      @product.destroy
    end
  end
end
