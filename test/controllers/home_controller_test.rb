require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get About_us" do
    get about_us_url
    assert_response :success
  end

  test "should get My_account" do
    get home_My_account_url
    assert_response :success
  end

  test "should get Sign_up" do
    get home_Sign_up_url
    assert_response :success
  end

end
