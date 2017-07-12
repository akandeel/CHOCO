require 'test_helper'

class ConsumerTest < ActiveSupport::TestCase

  def setup
    @consumer = Consumer.new(first_name: "Chocolate",
                             last_name: "Lover",
                             email_address: "choco@example.com",
                             password: "foobar",
                             assword_confirmation: "foobar")
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
