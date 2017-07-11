require 'test_helper'

class SessionsConsumersControllerTest < ActionDispatch::IntegrationTest
  test "should GET new" do
    get new_login_path
    assert_response :success
  end
end
