require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "if pseudo don't exist in the database" do
    user = User.new
    message = user.check_the_pseudo("AZE")
    assert_equal "OK", message[:message]
  end

  test "if pseudo exist in the database" do
    user = User.create(pseudo: "AZE")

    user = User.new
    message = user.check_the_pseudo("AZE")

    assert_not_equal "OK", message[:message]
  end


end
