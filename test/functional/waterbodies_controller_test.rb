require 'test_helper'

class WaterbodiesControllerTest < ActionController::TestCase
  setup do
    @waterbody = waterbodies(:one)
    @dadmin = dadmins(:one)
  end

  test "should get index" do
    sign_in @dadmin
    get :index

    assert_response :success
    assert_not_nil assigns(:waterbodies)
  end

  test "should get new" do
    sign_in @dadmin
    get :new

    assert_response :success
  end

  test "should create waterbody" do
    sign_in @dadmin
    @waterbody.name = "James River"
    assert_difference('Waterbody.count') do
      post :create, :waterbody => @waterbody.attributes
    end
    assert_redirected_to waterbody_path(assigns(:waterbody))
  end

  test "should not create waterbody with bad params" do
    sign_in @dadmin
    @waterbody.name = nil

    assert_no_difference('Waterbody.count') do
      post :create, :waterbody => @waterbody.attributes
    end
    assert_template 'new'
    assert_equal ["can't be blank"], assigns(:waterbody).errors.messages[:name]
  end

  test "should show waterbody" do
    sign_in @dadmin
    get :show, :id => @waterbody.to_param
    assert_response :success
  end

  test "should get edit" do
    sign_in @dadmin
    get :edit, :id => @waterbody.to_param

    assert_response :success
  end

  test "should update waterbody" do
    sign_in @dadmin
    put :update, :id => @waterbody.to_param, :waterbody => @waterbody.attributes

    assert_redirected_to waterbody_path(assigns(:waterbody))
  end

  test "should not update waterbody with bad params" do
    sign_in @dadmin
    @waterbody.name = ''
    put :update, :id => @waterbody.to_param, :waterbody => @waterbody.attributes

    assert_template 'edit'
    assert_equal ["can't be blank"], assigns(:waterbody).errors.messages[:name]
  end

  test "should destroy waterbody" do
    sign_in @dadmin

    assert_difference('Waterbody.count', -1) do
      delete :destroy, :id => @waterbody.to_param
    end
    assert_redirected_to waterbodies_path
  end
end
