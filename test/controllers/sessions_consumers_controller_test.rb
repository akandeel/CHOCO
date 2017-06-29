require 'test_helper'

class SessionsConsumersControllerTest < ActionDispatch::IntegrationTest
  test "should GET new" do
    get login_path
    assert_response :success
  end
end
