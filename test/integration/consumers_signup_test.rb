require 'test_helper'

class ConsumersSignupTest < ActionDispatch::IntegrationTest
   test "valid signup information" do
     get signup_path
     assert_difference 'Consumer.count', 1 do
    post users_path, params: { user: { name:  "Example User",
                                          email: "consumer@example.com",
                                          password:              "password",
                                          password_confirmation: "password" } }
   end
     follow_redirect! #to check acctual page.
     assert_template 'users/show'
     assert is_logged_in? #created test_helper and is a boolean check.
   end
end
