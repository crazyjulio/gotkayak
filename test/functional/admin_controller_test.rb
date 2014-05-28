require 'test_helper'

class AdminControllerTest < ActionController::TestCase

  setup do
    @dadmin = dadmins(:one)
  end

  test "should get index" do
    sign_in @dadmin
    get :index

    assert_response :success
  end

end
