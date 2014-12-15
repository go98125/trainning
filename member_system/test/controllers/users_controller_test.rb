require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get users_1" do
    get :users_1
    assert_response :success
  end

end
