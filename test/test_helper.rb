ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  #**** A boolean method for login status inside tests ****.

  #  (Because helper methods aren’t available in
  #tests, we can’t use the current_user
  #but the session method is
  #available, so we use that instead.)

  # **** Here we use is_logged_in? instead of logged_in? ****
  #so that the test helper and Sessions helper methods
  #have different names, which prevents
  # them from being mistaken for each other.

  # Returns true if a test user is logged in.
  def is_logged_in?
    !session[:consumer_id].nil?
  end

  # Log in as a particular user.
  #Inside integration tests, we can’t
  #manipulate session directly, but we
  #can post to the sessions path
  #which leads to the log_in_as
 def log_in_as(consumer)
   session[:user_id] = user.id
 end
end


 #Because it’s located inside the ActionDispatch::IntegrationTest
 #class, this is the version of log_in_as that will
 #be called inside integration tests. We use the
 #same method name in both cases because it lets
 #us do things like use code from a controller
 #test in an integration without making any
 #changes to the login method.

#Putting these two methods together yields the parallel log_in_as helpers
 class ActionDispatch::IntegrationTest

  # Log in as a particular user.
  def log_in_as(consumer, password: 'password', remember_me: '1')
    post login_path, params: { session: { email_address: consumer.email_address,
                                          password: password,
                                          remember_me: remember_me } }
  end

  # IN CONSUMERS_LOGIN_TEST.RB WE WILL USE THIS TO WRITE 2 TESTS FOR THE REMEMBER ME!

end
