require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "the clearance page" do
    get :clearance

    assert_response :success
    assert_not_nil assigns(:closeout_items)
    assert_not_nil assigns(:blem_items)
  end

  test "the adventures page" do
    get :adventures

    assert_response :success
    assert_not_nil assigns(:waterbodies)
  end

  test "the index page" do
    get :index

    assert_response :success
    assert_not_nil assigns(:events)
    assert_not_nil assigns(:news)
  end

  test "the faqs page" do
    get :faqs

    assert_response :success
    assert_not_nil assigns(:faqs)
  end

  test "the adventure page with only a waterbody" do
    get :adventure, :name => 'Yukon River'

    assert_response :success
    assert_equal assigns(:trips).length, 2
  end

  test "the adventure page with a waterbody and a trip name" do
    get :adventure, :name => 'Yukon River', :trip_name => 'Round trip'

    assert_response :success
    assert_equal assigns(:trip).name, 'Round trip'
  end
end
