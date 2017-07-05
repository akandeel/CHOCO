require 'test_helper'

class ConsumersLoginTest < ActionDispatch::IntegrationTest

  # ***** TEST FIXTURE Michael CREATED IN Consumers.yml. *****
  def setup
    @consumer = consumers(:michael)
  end

  # ***** ENSURE THAT FLASH MESSAGE DISAPPEARS ON NEW PAGE *****
  test "login with invalid information" do
  get login_path
  post login_path, params: { session: {email: "", password: ""}}

  assert_template 'sessions/new'
  assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email:    @consumer.email,
                                          password: 'password' } }
    assert_redirected_to @consumer
    follow_redirect!
    assert_template 'consumers/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", consumer_path(@consumer)
  end
end
