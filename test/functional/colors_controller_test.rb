require 'test_helper'

class ColorsControllerTest < ActionController::TestCase
  setup do
    @color = colors(:one)
    @dadmin = dadmins(:one)
  end

  test "should get index" do
    sign_in @dadmin
    get :index

    assert_response :success
    assert_not_nil assigns(:colors)
  end

  test "should get new" do
    sign_in @dadmin
    get :new

    assert_response :success
  end

  test "should create color" do
    sign_in @dadmin

    assert_difference('Color.count') do
      post :create, :color => @color.attributes
    end
    assert_redirected_to color_path(assigns(:color))
  end

  test "should not create color with bad params" do
    sign_in @dadmin
    @color.name = nil

    assert_no_difference('Color.count') do
      post :create, :color => @color.attributes
    end
    assert_template 'new'
    assert_equal ["can't be blank"], assigns(:color).errors.messages[:name]
  end

  test "should show color" do
    sign_in @dadmin
    get :show, :id => @color.to_param

    assert_response :success
  end

  test "should get edit" do
    sign_in @dadmin
    get :edit, :id => @color.to_param

    assert_response :success
  end

  test "should update color" do
    sign_in @dadmin
    put :update, :id => @color.to_param, :color => @color.attributes

    assert_redirected_to color_path(assigns(:color))
  end

  test "should not update color with bad params" do
    sign_in @dadmin
    @color.name = nil
    put :update, :id => @color.to_param, :color => @color.attributes

    assert_template 'edit'
    assert_equal ["can't be blank"], assigns(:color).errors.messages[:name]
  end

  test "should destroy color" do
    sign_in @dadmin

    assert_difference('Color.count', -1) do
      delete :destroy, :id => @color.to_param
    end
    assert_redirected_to colors_path
  end
end
