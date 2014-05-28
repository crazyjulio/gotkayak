require 'test_helper'

class ManufacturersControllerTest < ActionController::TestCase
  setup do
    @manufacturer = manufacturers(:one)
    @dadmin = dadmins(:one)
  end

  test "should get index" do
    sign_in @dadmin
    get :index

    assert_response :success
    assert_not_nil assigns(:manufacturers)
  end

  test "should get new" do
    sign_in @dadmin
    get :new

    assert_response :success
  end

  test "should_get_products" do
    sign_in @dadmin
    get :products, :id => @manufacturer.id

    assert_response :success
  end

  test "should_get_products_in_json" do
    sign_in @dadmin
    get :products, :format => :json, :id => @manufacturer.id

    assert_response :success
  end

  test "should_get_features" do
    sign_in @dadmin
    get :features, :id => @manufacturer.id

    assert_response :success
  end

  test "should create manufacturer" do
    sign_in @dadmin

    assert_difference('Manufacturer.count') do
      post :create, :manufacturer => @manufacturer.attributes
    end
    assert_redirected_to manufacturer_path(assigns(:manufacturer))
  end

  test "should not create manufacturer with bad params" do
    sign_in @dadmin
    @manufacturer.name = nil

    assert_no_difference('Manufacturer.count') do
      post :create, :manufacturer => @manufacturer.attributes
    end
    assert_template 'new'
    assert_equal ["can't be blank"], assigns(:manufacturer).errors.messages[:name]
  end

  test "should show manufacturer" do
    sign_in @dadmin
    get :show, :id => @manufacturer.to_param

    assert_response :success
  end

  test "should get edit" do
    sign_in @dadmin
    get :edit, :id => @manufacturer.to_param

    assert_response :success
  end

  test "should update manufacturer" do
    sign_in @dadmin
    put :update, :id => @manufacturer.to_param, :manufacturer => @manufacturer.attributes

    assert_redirected_to manufacturer_path(assigns(:manufacturer))
  end

  test "should not update manufacturer with bad params" do
    sign_in @dadmin
    @manufacturer.name = ''
    put :update, :id => @manufacturer.to_param, :manufacturer => @manufacturer.attributes

    assert_template 'edit'
    assert_equal ["can't be blank"], assigns(:manufacturer).errors.messages[:name]
  end

  test "should destroy manufacturer" do
    sign_in @dadmin

    assert_difference('Manufacturer.count', -1) do
      delete :destroy, :id => @manufacturer.to_param
    end
    assert_redirected_to manufacturers_path
  end
end
