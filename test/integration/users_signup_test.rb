require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
   test "valid signup information" do
     get signup_path
     assert_difference 'User.count', 1 do
    post users_path, params: { user: { first_name:  "Example",
                                              last_name: "User",
                                              gender: "male",
                                              date_of_birth: "TestDate",
                                              country: "Tokyo",
                                              street_number: "Wrong",
                                              street_name: "ErrorStreet",
                                              state: "America",
                                              suit: "TestSuit",
                                              mailing_address: "NotRight",
                                              email_address: "user@example.com",
                                              password:              "password",
                                              password_confirmation: "password" }
                                            }
end

     follow_redirect!
     assert_template 'users/show'
     #We’ve also included a call
     #to assert_template to check
     #that a failed submission re-renders the new action.
     assert is_logged_in? #created test_helper and is a boolean check.
   end
end
