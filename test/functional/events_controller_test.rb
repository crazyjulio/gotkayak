require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
    @dadmin = dadmins(:one)
  end

  test "should get index" do
    sign_in @dadmin
    get :index

    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    sign_in @dadmin
    get :new

    assert_response :success
  end

  test "should create event" do
    sign_in @dadmin

    assert_difference('Event.count') do
      post :create, event: @event.attributes
    end
    assert_redirected_to event_path(assigns(:event))
  end

  test "should not create event with bad params" do
    sign_in @dadmin
    @event.name = nil

    assert_no_difference('Event.count') do
      post :create, :event => @event.attributes
    end
    assert_template 'new'
    assert_equal ["can't be blank"], assigns(:event).errors.messages[:name]
  end

  test "should show event" do
    sign_in @dadmin
    get :show, id: @event

    assert_response :success
  end

  test "should get edit" do
    sign_in @dadmin
    get :edit, id: @event

    assert_response :success
  end

  test "should_set_text_area_rows_to_25" do
    @event = events(:two)
    sign_in @dadmin
    get :edit, :id => @event.id

    assert_equal 25, assigns(:event).text_area_rows
  end

  test "should update event" do
    sign_in @dadmin
    put :update, id: @event, event: @event.attributes

    assert_redirected_to event_path(assigns(:event))
  end

  test "should not update event with bad params" do
    sign_in @dadmin
    @event.name = ''
    put :update, :id => @event.to_param, :event => @event.attributes

    assert_template 'edit'
    assert_equal ["can't be blank"], assigns(:event).errors.messages[:name]
  end

  test "should destroy event" do
    sign_in @dadmin

    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end
    assert_redirected_to events_path
  end
end
