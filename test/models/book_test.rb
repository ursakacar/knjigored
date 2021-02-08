require "test_helper"

class BookTest < ActiveSupport::TestCase
  setup do
    @genre = genres(:one)
    @author = authors(:one)
  end

  test "should not save book without an author" do
    book = Book.new(
      internal_number: 5,
      title: "New title",
    )
    assert_not book.save
    assert_equal "Avtor ne sme biti prazen", book.errors.full_messages.first
  end

  test "should not save book without a title" do
    book = Book.new(
      internal_number: 5,
      title: "New title",
    )
    assert_not book.save
    assert_equal "Avtor ne sme biti prazen", book.errors.full_messages.first
  end

  test "should not save book without an internal number" do
    book = Book.new(
      title: "New title",
      author: @author,
    )
    assert_not book.save
    assert_equal "Interna številka ne sme biti prazna", book.errors.full_messages.first
  end

  test "should not save book if internal number is not a number" do
    book = Book.new(
      internal_number: "Not a number",
      title: "New title",
      author: @author,
    )
    assert_not book.save
    assert_equal "Interna številka ni številka", book.errors.full_messages.first
  end

  test "should not save book if internal number already exists" do
    book = Book.new(
      internal_number: "5",
      title: "New title",
      author: @author,
    )
    book_duplicated = Book.new(
      internal_number: "5",
      title: "Another new title",
      author: @author,
    )
    assert book.save
    assert_not book_duplicated.save
    assert_equal "Interna številka že obstaja", book_duplicated.errors.full_messages.first
  end

  test "should save book with all required parameters" do
    book = Book.new(
      internal_number: 5,
      title: "New title",
      author: @author,
    )
    assert book.save
    assert book.save
    assert 5, book.internal_number
    assert "New title", book.title
    assert @author, book.author
  end

  test "should save book witl all parameters" do
    book = Book.new(
      internal_number: 5,
      title: "New title",
      author: @author,
      genre: @genre,
    )
    assert book.save
    assert 5, book.internal_number
    assert "New title", book.title
    assert @author, book.author
    assert @genre, book.genre
  end

end
