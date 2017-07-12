require 'test_helper'

class ConsumersSignupTest < ActionDispatch::IntegrationTest
   test "valid signup information" do
     get signup_path
     assert_difference 'Consumer.count', 1 do
    post consumers_path, params: { consumer: { first_name:  "Example",
                                              last_name: "Consumer",
                                              email_address: "consumer@example.com",
                                              password:              "password",
                                              password_confirmation: "password" }
                                            }
end

     follow_redirect!
     assert_template 'consumers/show'
     assert is_logged_in? #created test_helper and is a boolean check.
   end
end
