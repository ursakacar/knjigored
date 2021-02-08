require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
    @book2 = books(:two)
  end

  test "should get index if logged in" do
    login
    get books_url
    assert_response :success
  end

  test "should get index if not logged in" do
    get books_url
    assert_response :success
  end

  test "should show book if logged in" do
    login
    get book_url(@book)
    assert_response :success
  end

  test "should not show book if not logged in" do
    get book_url(@book)
    assert_response :redirect
    assert_redirected_to new_session_path
  end

  test "should get new if logged in" do
    login
    get new_book_url
    assert_response :success
  end

  test "should not get new if not logged in" do
    get new_book_url
    assert_response :redirect
    assert_redirected_to new_session_path
  end

  test "should get edit if logged in" do
    login
    get edit_book_url(@book)
    assert_response :success
  end

  test "should not get edit if not logged in" do
    get edit_book_url(@book)
    assert_response :redirect
    assert_redirected_to new_session_path
  end

  test "should create book with existing author if logged in" do
    login
    assert_difference('Book.count') do
      post books_url, params: { book: { author_name: authors(:one).name, genre_id: genres(:one).id, internal_number: 5, is_borrowed: @book.is_borrowed, title: "Title" } }
    end

    assert_redirected_to book_url(Book.last)

    created_book = Book.all.order(created_at: :desc).first
    assert_equal created_book.author_id, authors(:one).id
    assert_equal created_book.genre_id, genres(:one).id
    assert_equal created_book.internal_number, 5
    assert_equal created_book.is_borrowed, @book.is_borrowed
    assert_equal created_book.title, "Title"
  end

  test "should create book with new author if logged in" do
    login
    assert_difference('Book.count') do
      assert_difference('Author.count') do
        post books_url, params: { book: { author_name: "New Author", genre_id: genres(:one).id, internal_number: 5, is_borrowed: @book.is_borrowed, title: "Title" } }
      end
    end

    assert_redirected_to book_url(Book.last)

    created_book = Book.all.order(created_at: :desc).first
    created_author = Author.all.order(created_at: :desc).first

    assert_equal created_book.author_id, created_author.id
    assert_equal created_book.genre_id, genres(:one).id
    assert_equal created_book.internal_number, 5
    assert_equal created_book.is_borrowed, @book.is_borrowed
    assert_equal created_book.title, "Title"
  end

  test "should not create book if not logged in" do
    assert_no_difference('Book.count') do
      post books_url, params: { book: { author_name: authors(:one).name, genre_id: genres(:one).id, internal_number: 5, is_borrowed: @book.is_borrowed, title: "Title" } }
    end

    assert_response :redirect
    assert_redirected_to new_session_path
  end

  test "should update book if logged in" do
    login
    patch book_url(@book), params: { book: { author_name: authors(:two).name, genre_id: genres(:two).id, internal_number: 5, is_borrowed: true, title: @book2.title } }
    assert_redirected_to book_url(@book)

    updated_book = Book.find(@book.id)
    assert_equal updated_book.author_id, authors(:two).id
    assert_equal updated_book.genre_id,  genres(:two).id
    assert_equal updated_book.internal_number, 5
    assert_equal updated_book.is_borrowed, true
    assert_equal updated_book.title,  @book2.title
  end

  test "should not update book with existing internal number" do
    login
    patch book_url(@book), params: { book: { internal_number: 2 } }

    updated_book = Book.find(@book.id)
    assert_equal updated_book.author_id, @book.author_id
    assert_equal updated_book.genre_id, @book.genre_id
    assert_equal updated_book.internal_number, @book.internal_number
    assert_equal updated_book.title, @book.title
    assert_equal updated_book.is_borrowed, @book.is_borrowed
  end

  test "should not update book if not logged in" do
    patch book_url(@book), params: { book: { author_id: "New Author", genre_id: "genre", internal_number: 11, is_borrowed: true, title: "New Title" } }

    assert_response :redirect
    assert_redirected_to new_session_path

    updated_book = Book.find(@book.id)
    assert_equal updated_book.author_id, @book.author_id
    assert_equal updated_book.genre_id, @book.genre_id
    assert_equal updated_book.internal_number, @book.internal_number
    assert_equal updated_book.title, @book.title
    assert_equal updated_book.is_borrowed, @book.is_borrowed
  end

  test "should destroy book if logged in" do
    login
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end

  test "should not destroy book if not logged in" do
    assert_no_difference('Book.count') do
      delete book_url(@book)
    end

    assert_response :redirect
    assert_redirected_to new_session_path
  end
end


# test "should update author if logged in" do
#   login
#   patch author_url(@author), params: { author: { name: "New Author" } }
#   assert_redirected_to author_url(@author)

#   updated_author = Author.find(@author.id)
#   assert_equal updated_author.name, "New Author"
# end

# test "should not update author with duplicate name if logged in" do
#   login
#   patch author_url(@author), params: { author: { name: @author2.name } }
#   updated_author = Author.find(@author.id)
#   assert_equal updated_author.name, @author.name
# end