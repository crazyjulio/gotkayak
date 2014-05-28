require 'test_helper'

class TripsControllerTest < ActionController::TestCase
  setup do
    @trip = trips(:one)
    @dadmin = dadmins(:one)
  end

  test "should get index" do
    sign_in @dadmin
    get :index

    assert_response :success
    assert_not_nil assigns(:trips)
  end

  test "should get new" do
    sign_in @dadmin
    get :new

    assert_response :success
  end

  test "should get new and_pre-populate waterbody" do
    sign_in @dadmin
    get :new, :waterbody_id => 1

    assert_response :success
    assert_equal "Yukon River", assigns(:trip).waterbody.name
  end

  test "should create trip" do
    sign_in @dadmin

    assert_difference('Trip.count') do
      post :create, :trip => @trip.attributes
    end
    assert_redirected_to trip_path(assigns(:trip))
  end

  test "should not create trip with bad params" do
    sign_in @dadmin
    @trip.name = nil

    assert_no_difference('Trip.count') do
      post :create, :trip => @trip.attributes
    end
    assert_template 'new'
    assert_equal ["can't be blank"], assigns(:trip).errors.messages[:name]
  end

  test "should show trip" do
    sign_in @dadmin
    get :show, :id => @trip.to_param

    assert_response :success
  end

  test "should get edit" do
    sign_in @dadmin
    get :edit, :id => @trip.to_param

    assert_response :success
  end

  test "should update trip" do
    sign_in @dadmin
    put :update, :id => @trip.to_param, :trip => @trip.attributes

    assert_redirected_to trip_path(assigns(:trip))
  end

  test "should not update trip with bad params" do
    sign_in @dadmin
    @trip.name = nil
    put :update, :id => @trip.to_param, :trip => @trip.attributes

    assert_template 'edit'
    assert_equal ["can't be blank"], assigns(:trip).errors.messages[:name]
  end

  test "should destroy trip" do
    sign_in @dadmin

    assert_difference('Trip.count', -1) do
      delete :destroy, :id => @trip.to_param
    end
    assert_redirected_to trips_path
  end
end
