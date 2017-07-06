require 'test_helper'

class ConsumerTest < ActiveSupport::TestCase

  def setup
    @consumer = Consumer.new(name: "Chocolate Lover", email: "choco@example.com",
                     password: "foobar", password_confirmation: "foobar")
  en
  .
  .
  .
  test "authenticated? should return false for a consumer with nil digest" do
    assert_not @consumer.authenticated?('')
  end
end
