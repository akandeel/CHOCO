require 'test_helper'

class ConsumersLoginTest < ActionDispatch::IntegrationTest

  # ***** TEST FIXTURE Michael CREATED IN Consumers.yml. *****
  def setup
    @consumer = consumers(:michael)
  end

  # ***** ENSURE THAT FLASH MESSAGE DISAPPEARS ON NEW PAGE *****
  test "login with invalid information" do
    get login_path
    post login_path, params: { session: {email_address: "", password: ""}}

    assert_template 'sessions/new'
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email_address: @consumer.email_address,
                                                     password: 'password' }
                                                   }


    assert_redirected_to @consumer #to check the right redirect target
    follow_redirect! #to actually visit the target page.
    assert_template 'consumers/show'
    assert_select "a[href=?]", login_path, count: 0 #we expect there to be zero links matching the given pattern.
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", consumer_path(@consumer)
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email_address:    @consumer.email_address,
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

    delete logout_path # Simulate a consumer clicking logout in a second window.
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", consumer_path(@consumer), count: 0
  end

  #Because remembering users requires that they be
  #logged in, our first step is to define a helper
  #to log users in inside tests. We logged a user in using the
  #post method and a valid session hash, but it’s cumbersome
  #to do this every time. To avoid needless repetition,
  #we’ll write a helper method called log_in_as to log in for us.


  #To verify the behavior of the “remember me” checkbox, we’ll
  #write two tests, one each for submitting with and without
  #the checkbox checked.
  test "login with remembering" do
   log_in_as(@consumer, remember_me: '1')
   assert_not_empty cookies['remember_token']
   #assert_equal FILL_IN, assigns(:user).FILL_IN
   # you can access instance variables defined in
   # the controller by using assigns.
   # Right now, the Sessions controller create action
   # defines a normal (non-instance) variable called
   # user, but if we change it to an instance variable we can
   # test that cookies correctly contains the user’s remember token.
  end

  test "login without remembering" do
   # Log in to set the cookie.
   log_in_as(@consumer, remember_me: '1')
   # Log in again and verify that the cookie is deleted.
   log_in_as(@consumer, remember_me: '0')
   assert_empty cookies['remember_token']
 end
end
