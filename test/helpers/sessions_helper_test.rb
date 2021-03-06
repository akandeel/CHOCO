#Define a user variable using the fixtures.
#Call the remember method to remember the given user.
#Verify that current_user is equal to the given user.


require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @user = users(:michael)
    remember(@user) #Because the remember method doesn’t set session[:user_id], this procedure will test the desired “remember” branch.
  end

  #Because the remember method doesn’t set session[:user_id],
  #this procedure will test the desired “remember” branch
  test "current_user returns right user" do
    assert_equal @user, current_user
    assert is_logged_in?
  end

  test "current_user returns nil when remember digest is wrong" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end

  # Note that we’ve added a second test, which checks that the current user is nil if the user’s remember digest doesn’t correspond correctly to the remember token, thereby testing the authenticated? expression in the nested if statement:
  #if user && user.authenticated?(cookies[:remember_token])
end
