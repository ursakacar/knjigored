require 'test_helper'

class AuthorTest < ActiveSupport::TestCase

  test "should not save author without a name" do
    author = Author.new(
    )
    assert_not author.save
    assert_equal "Ime ne sme biti prazno", author.errors.full_messages.first
  end

  test "should not save author with duplicate name" do
    author = Author.new(
      name: "Nov Avtor",
    )
    author_duplicated = Author.new(
      name: "Nov Avtor",
    )
    assert author.save
    assert_not author_duplicated.save
    assert "Nov Avtor", author.name
    assert_equal "Ime že obstaja", author_duplicated.errors.full_messages.first
  end

  test "should save author with name" do
    author = Author.new(
      name: "Nov Avtor",
    )
    assert author.save
    assert "Nov Avtor", author.name
  end

end