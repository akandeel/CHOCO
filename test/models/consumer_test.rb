require 'test_helper'

class ConsumerTest < ActiveSupport::TestCase

  def setup
    @consumer = Consumer.new(first_name: "michael",
                             last_name: "example",
                             gender: "male",
                             date_of_birth: "test_date",
                             country: "Canada",
                             street_number: "41",
                             street_name: "Hollywood Blvd.",
                             state: "Mystring",
                             suit: "20",
                             mailing_address: "MyString",
                             email_address: "m.example@example.com",
                             password: "password",
                             password_confirmation: "password")



  end


  test "email_addresses should be unique" do
    duplicate_consumer = @consumer.dup
    duplicate_consumer.email_address = @consumer.email_address.upcase
    @consumer.save
    assert_not duplicate_consumer.valid?
  end


  test "password should be present (nonblank)" do
    @consumer.password = @consumer.password_confirmation = " " * 6
    assert_not @consumer.valid?
  end

  test "password should have a minimum length" do
    @consumer.password = @consumer.password_confirmation = "a" * 5
    assert_not @consumer.valid?
  end

  #this is easier to test in model rather than integration. which is why its here.
  test "authenticated? method. It should return false for a consumer with nil digest" do
    assert_not @consumer.authenticated?('')
  end
end
