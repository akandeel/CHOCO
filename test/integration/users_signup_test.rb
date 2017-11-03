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
                                              suit_number: "TestSuit",
                                              mailing_address: "NotRight",
                                              email_address: "user@example.com",
                                              password:              "password",
                                              password_confirmation: "password" }
                                            }
end

     #We’ve also included a call
     #to assert_template to check
     #that a failed submission re-renders the new action.
    # assert is_logged_in? #created test_helper and is a boolean check.
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
#the first few assertions are important to the app. the following tests are trivial.

    asser_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?

# the following tests are to try to log in before activation.
    log_in as(user)
    assert_not user.activated?

#these tests are to try to send activation email with wrong activation token.
    get edit_account_activation_path(user.activation_token, email_address: 'wrong')
    assert_not is_logged_in?
#Now do the same with valid activation token.
    get edit_account_acitvation_path(user.activation_token, email: user.email)
    assert user.reload.activated?

   end
end
