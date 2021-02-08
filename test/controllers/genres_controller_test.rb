require 'test_helper'

class GenresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @genre = genres(:one)
    @genre2 = genres(:two)
  end

  test "should get index if logged in" do
    login
    get genres_url
    assert_response :success
  end

  test "should not get index if not logged in" do
    get genres_url
    assert_response :redirect
    assert_redirected_to new_session_path
  end

  test "should show genre if logged in" do
    login
    get genre_url(@genre)
    assert_response :success
  end

  test "should not show genre if not logged in" do
    get genre_url(@genre)
    assert_response :redirect
    assert_redirected_to new_session_path
  end

  test "should get new if logged in" do
    login
    get new_genre_url
    assert_response :success
  end

  test "should not get new if not logged in" do
    get new_genre_url
    assert_response :redirect
    assert_redirected_to new_session_path
  end

  test "should get edit if logged in" do
    login
    get edit_genre_url(@genre)
    assert_response :success
  end

  test "should not get edit if not logged in" do
    get edit_genre_url(@genre)
    assert_response :redirect
    assert_redirected_to new_session_path
  end

  test "should create genre if logged in" do
    login
    assert_difference('Genre.count') do
      post genres_url, params: { genre: { name: 'genre' } }
    end

    assert_redirected_to genre_url(Genre.last)

    created_genre = Genre.all.order(created_at: :desc).first
    assert_equal created_genre.name, "genre"
  end

  test "should not create genre if not logged in" do
    assert_no_difference('Genre.count') do
      post genres_url, params: { genre: { name: 'genre' } }
    end

    assert_response :redirect
    assert_redirected_to new_session_path
  end

  test "should update genre if logged in" do
    login
    patch genre_url(@genre), params: { genre: { name: 'genre' } }
    assert_redirected_to genre_url(@genre)

    updated_genre = Genre.find(@genre.id)
    assert_equal updated_genre.name, "genre"
  end

  test "should not update genre with duplicate name if logged in" do
    login
    patch genre_url(@genre), params: { genre: { name: @genre2.name } }
    updated_genre = Genre.find(@genre.id)
    assert_equal updated_genre.name, @genre.name
  end

  test "should not update genre if not logged in" do
    patch genre_url(@genre), params: { genre: { name: 'genre' } }
    assert_response :redirect
    assert_redirected_to new_session_path

    updated_genre = Genre.find(@genre.id)
    assert_equal updated_genre.name, @genre.name
  end

  test "should destroy genre if logged in" do
    login
    post genres_url, params: { genre: { name: 'genre' } }
    created_genre = Genre.all.order(created_at: :desc).first

    assert_difference('Genre.count', -1) do
      delete genre_url(created_genre)
    end

    assert_redirected_to genres_url
  end

  test "should not destroy genre with books if logged in" do
    login
    assert_no_difference('Genre.count') do
      delete genre_url(@genre)
    end

    assert_redirected_to genres_url
  end

  test "should not destroy genre if not logged in" do
    assert_no_difference('Genre.count') do
      delete genre_url(@genre)
    end

    assert_response :redirect
    assert_redirected_to new_session_path
  end
end
