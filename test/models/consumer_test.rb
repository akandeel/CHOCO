require 'test_helper'

class ConsumerTest < ActiveSupport::TestCase

  def setup
    @consumer = Consumer.new(first_name: "Chocolate", last_name: "Lover", email_address: "choco@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  #this is easier to test in model rather than integration. which is why its here.
  test "authenticated? method. It should return false for a consumer with nil digest" do
    assert_not @consumer.authenticated?('')
  end
end
