require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get About_us" do
    get pages_about_us_url
    assert_response :success
  end

  test "should get My_account" do
    get pages_My_account_url
    assert_response :success
  end

  test "should get Sign_up" do
    get pages_Sign_up_url
    assert_response :success
  end
end
