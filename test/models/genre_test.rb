require 'test_helper'

class GenreTest < ActiveSupport::TestCase

  test "should not save genre without a name" do
    genre = Genre.new(
    )
    assert_not genre.save
    assert_equal "Ime ne sme biti prazno", genre.errors.full_messages.first
  end

  test "should not save genre with duplicate name" do
    genre = Genre.new(
      name: "fantasy",
    )
    genre_duplicated = genre.new(
      name: "fantasy",
    )
    assert genre.save
    assert_not genre_duplicated.save
    assert "fantasy", genre.name
    assert_equal "Zvrst že obstaja", genre_duplicated.errors.full_messages.first
  end

  test "should save genre with name" do
    genre = Genre.new(
      name: "fantasy",
    )
    assert genre.save
    assert "fantasy", genre.name
  end
end
