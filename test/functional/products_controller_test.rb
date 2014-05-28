require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @dadmin = dadmins(:one)
  end

  test "should get index" do
    sign_in @dadmin
    get :index

    assert_response :success
    assert_not_nil assigns(:products)
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
    assert_equal "Malibu", assigns(:product).manufacturer.name
  end

  test "should create product" do
    sign_in @dadmin

    assert_difference('Product.count') do
      post :create, product: @product.attributes
    end
    assert_redirected_to product_path(assigns(:product))
  end

  test "should not create product with bad params" do
    sign_in @dadmin
    @product.name = nil

    assert_no_difference('Product.count') do
      post :create, :product => @product.attributes
    end
    assert_template 'new'
    assert_equal ["can't be blank"], assigns(:product).errors.messages[:name]
  end

  test "should show product" do
    sign_in @dadmin
    get :show, id: @product

    assert_response :success
  end

  test "should get edit" do
    sign_in @dadmin
    get :edit, id: @product

    assert_response :success
  end

  test "should update product" do
    sign_in @dadmin
    put :update, id: @product, product: @product.attributes

    assert_redirected_to product_path(assigns(:product))
  end

  test "should not update product with bad params" do
    sign_in @dadmin
    @product.name = nil
    put :update, :id => @product.to_param, :product => @product.attributes

    assert_template 'edit'
    assert_equal ["can't be blank"], assigns(:product).errors.messages[:name]
  end

  test "should destroy product" do
    sign_in @dadmin

    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end
    assert_redirected_to products_path
  end
end
