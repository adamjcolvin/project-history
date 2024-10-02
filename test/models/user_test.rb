require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user has many comments" do
      user = users(:one)
      assert_respond_to user, :comments
    end
end
