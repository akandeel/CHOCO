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

end
