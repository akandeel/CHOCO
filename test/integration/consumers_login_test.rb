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
    assert_redirected_to @consumer #to check the right redirect target
    follow_redirect! #to actually visit the target page.
    assert_template 'consumers/show'
    assert_select "a[href=?]", login_path, count: 0 #we expect there to be zero links matching the given pattern.
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", consumer_path(@consumer)
  end

  test "login with valid information followed by logout" do
  get login_path
  post login_path, params: { session: { email:    @consumer.email,
                                        password: 'password' } }
  assert is_logged_in? # also tests that this happens immediately after posting valid information to sessions path.
  assert_redirected_to @consumer
  follow_redirect!
  assert_template 'consumers/show'
  assert_select "a[href=?]", login_path, count: 0
  assert_select "a[href=?]", logout_path
  assert_select "a[href=?]", consumer_path(@consumer)
  delete logout_path
  assert_not is_logged_in?
  assert_redirected_to root_url

  # # Simulate a consumer clicking logout in a second window.
  delete logout_path
  follow_redirect!
  assert_select "a[href=?]", login_path
  assert_select "a[href=?]", logout_path,      count: 0
  assert_select "a[href=?]", consumer_path(@consumer), count: 0
end
end
