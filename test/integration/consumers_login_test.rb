require 'test_helper'

class ConsumersLoginTest < ActionDispatch::IntegrationTest
  # ***** ENSURE THAT FLASH MESSAGE DISAPPEARS ON NEW PAGE *****
  test "login with invalid information" do
  get login_path
  assert_template 'sessions/new'
  post login_path, params: { session: {email: "", password: ""}}
  assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
