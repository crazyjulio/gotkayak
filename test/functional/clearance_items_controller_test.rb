require 'test_helper'

class ClearanceItemsControllerTest < ActionController::TestCase
  setup do
    @dadmin = dadmins(:one)
    @clearance_item = clearance_items(:one)
  end

  test "should get index" do
    sign_in @dadmin
    get :index

    assert_response :success
    assert_not_nil assigns(:clearance_items)
  end

  test "should get new" do
    sign_in @dadmin
    get :new

    assert_response :success
  end

  test "should create clearance_item" do
    sign_in @dadmin

    assert_difference('ClearanceItem.count') do
      post :create, clearance_item: @clearance_item.attributes
    end
    assert_redirected_to clearance_item_path(assigns(:clearance_item))
  end

  test "should not create clearance_item with bad params" do
    sign_in @dadmin
    @clearance_item.product_id = nil

    assert_no_difference('ClearanceItem.count') do
      post :create, :clearance_item => @clearance_item.attributes
    end
    assert_template 'new'
    assert_equal ["can't be blank"], assigns(:clearance_item).errors.messages[:product_id]
  end

  test "should show clearance_item" do
    sign_in @dadmin
    get :show, id: @clearance_item

    assert_response :success
  end

  test "should get edit" do
    sign_in @dadmin
    get :edit, id: @clearance_item

    assert_response :success
  end

  test "should update clearance_item" do
    sign_in @dadmin
    put :update, id: @clearance_item, clearance_item: @clearance_item.attributes

    assert_redirected_to clearance_item_path(assigns(:clearance_item))
  end

  test "should not update clearance_item with bad params" do
    sign_in @dadmin
    @clearance_item.product_id = nil
    put :update, :id => @clearance_item.to_param, :clearance_item => @clearance_item.attributes

    assert_template 'edit'
    assert_equal ["can't be blank"], assigns(:clearance_item).errors.messages[:product_id]
  end

  test "should destroy clearance_item" do
    sign_in @dadmin

    assert_difference('ClearanceItem.count', -1) do
      delete :destroy, id: @clearance_item
    end
    assert_redirected_to clearance_items_path
  end
end
