require 'test_helper'

class PaddlersControllerTest < ActionController::TestCase
  setup do
    @paddler = paddlers(:one)
    @dadmin = dadmins(:one)
  end

  test "should get index" do
    sign_in @dadmin
    get :index

    assert_response :success
    assert_not_nil assigns(:paddlers)
  end

  test "should get new" do
    sign_in @dadmin
    get :new

    assert_response :success
  end

  test "should create paddler" do
    sign_in @dadmin

    assert_difference('Paddler.count') do
      post :create, :paddler => @paddler.attributes
    end
    assert_redirected_to paddler_path(assigns(:paddler))
  end

  test "should not create paddler with bad params" do
    sign_in @dadmin
    @paddler.name = nil

    assert_no_difference('Paddler.count') do
      post :create, :paddler => @paddler.attributes
    end
    assert_template 'new'
    assert_equal ["can't be blank"], assigns(:paddler).errors.messages[:name]
  end

  test "should show paddler" do
    sign_in @dadmin
    get :show, :id => @paddler.to_param

    assert_response :success
  end

  test "should get edit" do
    sign_in @dadmin
    get :edit, :id => @paddler.to_param

    assert_response :success
  end

  test "should update paddler" do
    sign_in @dadmin
    put :update, :id => @paddler.to_param, :paddler => @paddler.attributes

    assert_redirected_to paddler_path(assigns(:paddler))
  end

  test "should not update paddler with bad params" do
    sign_in @dadmin
    @paddler.name = nil
    put :update, :id => @paddler.to_param, :paddler => @paddler.attributes

    assert_template 'edit'
    assert_equal ["can't be blank"], assigns(:paddler).errors.messages[:name]
  end

  test "should destroy paddler" do
    sign_in @dadmin

    assert_difference('Paddler.count', -1) do
      delete :destroy, :id => @paddler.to_param
    end
    assert_redirected_to paddlers_path
  end
end
