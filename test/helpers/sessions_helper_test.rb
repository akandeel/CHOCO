#Define a user variable using the fixtures.
#Call the remember method to remember the given user.
#Verify that current_user is equal to the given user.


require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @consumer = consumers(:michael)
    remember(@consumer) #Because the remember method doesn’t set session[:user_id], this procedure will test the desired “remember” branch.
  end

  #Because the remember method doesn’t set session[:user_id],
  #this procedure will test the desired “remember” branch
  test "current_consumer returns right consumer" do
    assert_equal @consumer, current_consumer
    assert is_logged_in?
  end

  test "current_consumer returns nil when remember digest is wrong" do
    @consumer.update_attribute(:remember_digest, Consumer.digest(Consumer.new_token))
    assert_nil current_consumer
  end

  # Note that we’ve added a second test, which checks that the current consumer is nil if the consumer’s remember digest doesn’t correspond correctly to the remember token, thereby testing the authenticated? expression in the nested if statement:
  #if user && user.authenticated?(cookies[:remember_token])
end
