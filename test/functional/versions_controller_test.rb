require 'test_helper'

class VersionsControllerTest < ActionController::TestCase
  setup do
    @version = versions(:one)
    @dadmin = dadmins(:one)
  end

  test "should get index" do
    sign_in @dadmin
    get :index

    assert_response :success
    assert_not_nil assigns(:versions)
  end

  test "should get new" do
    sign_in @dadmin
    get :new

    assert_response :success
  end

  test "should create version" do
    sign_in @dadmin

    assert_difference('Version.count') do
      post :create, :version => @version.attributes
    end
    assert_redirected_to version_path(assigns(:version))
  end

  test "should not create version with bad params" do
    sign_in @dadmin
    @version.name = nil

    assert_no_difference('Version.count') do
      post :create, :version => @version.attributes
    end
    assert_template 'new'
    assert_equal ["can't be blank"], assigns(:version).errors.messages[:name]
  end

  test "should show version" do
    sign_in @dadmin
    get :show, :id => @version.to_param

    assert_response :success
  end

  test "should get edit" do
    sign_in @dadmin
    get :edit, :id => @version.to_param

    assert_response :success
  end

  test "should update version" do
    sign_in @dadmin
    put :update, :id => @version.to_param, :version => @version.attributes

    assert_redirected_to version_path(assigns(:version))
  end

  test "should not update version with bad params" do
    sign_in @dadmin
    @version.price = nil
    put :update, :id => @version.to_param, :version => @version.attributes

    assert_template 'edit'
    assert_equal ["can't be blank", "is not a number"], assigns(:version).errors.messages[:price]
  end

  test "should destroy version" do
    sign_in @dadmin

    assert_difference('Version.count', -1) do
      delete :destroy, :id => @version.to_param
    end
    assert_redirected_to versions_path
  end
end
