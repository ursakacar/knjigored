require "test_helper"

class LibrarianTest < ActiveSupport::TestCase
  test "login valid should return true with correct credentials" do
    librarian = Librarian.new
      .tap { |su| su.username = 'test' }
      .tap { |su| su.password = 'test1234' }
    assert_equal true, librarian.login_valid?

  end

  test "login valid should return false with wrong username" do
    librarian = Librarian.new
      .tap { |su| su.username = 'wrongusername' }
      .tap { |su| su.password = 'test1234' }
      assert_equal false, librarian.login_valid?
  end

  test "login valid should return false with wrong password" do
    librarian = Librarian.new
      .tap { |su| su.username = 'test' }
      .tap { |su| su.password = 'wrongpassword' }
      assert_equal false, librarian.login_valid?
  end
end
