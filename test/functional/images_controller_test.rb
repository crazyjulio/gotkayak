require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  setup do
    @image = images(:one)
    @dadmin = dadmins(:one)
  end

  test "should get index" do
    sign_in @dadmin
    get :index

    assert_response :success
    assert_not_nil assigns(:images)
  end

  test "should get new" do
    sign_in @dadmin
    get :new

    assert_response :success
  end

  test "should create image" do
    sign_in @dadmin

    assert_difference('Image.count') do
      post :create, :image => {:file => fixture_file_upload('files/test.png', 'image/png'), :model => @image.model, :model_id => @image.model_id, :tag => @image.tag}
    end
    assert_redirected_to image_path(assigns(:image))
  end

  test "should not create image with bad params" do
    sign_in @dadmin
    @image.tag = nil

    assert_no_difference('Image.count') do
      post :create, :image => @image.attributes
    end
    assert_template 'new'
    assert_equal ["can't be blank"], assigns(:image).errors.messages[:tag]
  end

  test "should show image" do
    sign_in @dadmin
    get :show, :id => @image.to_param

    assert_response :success
  end

  test "should get edit" do
    sign_in @dadmin
    get :edit, :id => @image.to_param

    assert_response :success
  end

  test "should update image" do
    sign_in @dadmin
    put :update, :id => @image.to_param, :image => {:file => fixture_file_upload('files/test.png', 'image/png'), :model => 'Paddler', :model_id => @image.model_id, :tag => @image.tag}

    assert_redirected_to image_path(assigns(:image))
  end

  test "should not update image with bad params" do
    sign_in @dadmin
    @image.tag = ''
    put :update, :id => @image.to_param, :image => @image.attributes

    assert_template 'edit'
    assert_equal ["can't be blank"], assigns(:image).errors.messages[:tag]
  end

  test "should destroy image" do
    sign_in @dadmin

    assert_difference('Image.count', -1) do
      delete :destroy, :id => @image.to_param
    end
    assert_redirected_to images_path
  end
end
