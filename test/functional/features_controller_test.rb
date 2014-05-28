require 'test_helper'

class FeaturesControllerTest < ActionController::TestCase
  setup do
    @feature = features(:one)
    @dadmin = dadmins(:one)
  end

  test "should get index" do
    sign_in @dadmin
    get :index

    assert_response :success
    assert_not_nil assigns(:features)
  end

  test "should get new" do
    sign_in @dadmin
    get :new

    assert_response :success
  end

  test "should get new and_pre-populate manufacturer" do
    sign_in @dadmin
    get :new, :manufacturer_id => 1

    assert_response :success
    assert_equal "Malibu", assigns(:feature).manufacturer.name
  end

  test "should create feature" do
    sign_in @dadmin

    assert_difference('Feature.count') do
      post :create, :feature => @feature.attributes
    end
    assert_redirected_to feature_path(assigns(:feature))
  end

  test "should not create feature with bad params" do
    sign_in @dadmin
    @feature.name = nil

    assert_no_difference('Feature.count') do
      post :create, :feature => @feature.attributes
    end
    assert_template 'new'
    assert_equal ["can't be blank"], assigns(:feature).errors.messages[:name]
  end

  test "should show feature" do
    sign_in @dadmin
    get :show, :id => @feature.to_param

    assert_response :success
  end

  test "should get edit" do
    sign_in @dadmin
    get :edit, :id => @feature.to_param

    assert_response :success
  end

  test "should update feature" do
    sign_in @dadmin
    put :update, :id => @feature.to_param, :feature => @feature.attributes

    assert_redirected_to feature_path(assigns(:feature))
  end

  test "should not update feature with bad params" do
    sign_in @dadmin
    @feature.name = nil
    put :update, :id => @feature.to_param, :feature => @feature.attributes

    assert_template 'edit'
    assert_equal ["can't be blank"], assigns(:feature).errors.messages[:name]
  end

  test "should destroy feature" do
    sign_in @dadmin

    assert_difference('Feature.count', -1) do
      delete :destroy, :id => @feature.to_param
    end
    assert_redirected_to features_path
  end
end
