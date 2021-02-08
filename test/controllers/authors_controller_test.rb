require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:one)
    @author2 = authors(:two)
  end

  test "should get index if logged in" do
    login
    get authors_url
    assert_response :success
  end

  test "should not get index if not logged in" do
    get authors_url
    assert_response :redirect
    assert_redirected_to new_session_path
  end

  test "should show author if logged in" do
    login
    get author_url(@author)
    assert_response :success
  end

  test "should not show author if not logged in" do
    get author_url(@author)
    assert_response :redirect
    assert_redirected_to new_session_path
  end

  test "should get new if logged in" do
    login
    get new_author_url
    assert_response :success
  end

  test "should not get new if not logged in" do
    get new_author_url
    assert_response :redirect
    assert_redirected_to new_session_path
  end

  test "should get edit if logged in" do
    login
    get edit_author_url(@author)
    assert_response :success
  end

  test "should not get edit if not logged in" do
    get edit_author_url(@author)
    assert_response :redirect
    assert_redirected_to new_session_path
  end

  test "should create author if logged in" do
    login
    assert_difference('Author.count') do
      post authors_url, params: { author: { name: 'New Author' } }
    end

    assert_redirected_to author_url(Author.last)

    created_author = Author.all.order(created_at: :desc).first
    assert_equal created_author.name, "New Author"
  end

  test "should not create author if not logged in" do
    assert_no_difference('Author.count') do
      post authors_url, params: { author: { name: 'New Author' } }
    end

    assert_response :redirect
    assert_redirected_to new_session_path
  end

  test "should update author if logged in" do
    login
    patch author_url(@author), params: { author: { name: "New Author" } }
    assert_redirected_to author_url(@author)

    updated_author = Author.find(@author.id)
    assert_equal updated_author.name, "New Author"
  end

  test "should not update author with duplicate name if logged in" do
    login
    patch author_url(@author), params: { author: { name: @author2.name } }
    updated_author = Author.find(@author.id)
    assert_equal updated_author.name, @author.name
  end

  test "should not update author if not logged in" do
    patch author_url(@author), params: { author: { name: 'New Author' } }
    assert_response :redirect
    assert_redirected_to new_session_path

    updated_author = Author.find(@author.id)
    assert_equal updated_author.name, @author.name
  end

  test "should destroy author if logged in" do
    login
    post authors_url, params: { author: { name: 'New Author' } }
    created_author = Author.all.order(created_at: :desc).first

    assert_difference('Author.count', -1) do
      delete author_url(created_author)
    end

    assert_redirected_to authors_url
  end

  test "should not destroy author with books if logged in" do
    login
    assert_no_difference('Author.count') do
      delete author_url(@author)
    end

    assert_redirected_to authors_url
  end

  test "should not destroy author if not logged in" do
    assert_no_difference('Author.count') do
      delete author_url(@author)
    end

    assert_response :redirect
    assert_redirected_to new_session_path
  end
end
