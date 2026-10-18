
require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
    @user = users(:one)

    post session_url, params: {
      name: @user.name,
      password: "password"
    }
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get show" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should not edit another user's book" do
    other_book = books(:two)

    get edit_book_url(other_book)

    assert_redirected_to books_url
  end

  test "should not update another user's book" do
    other_book = books(:two)
    original_title = other_book.title

    patch book_url(other_book), params: {
      book: { title: "Unauthorized Update" }
    }

    assert_redirected_to books_url
    assert_equal original_title, other_book.reload.title
  end

test "should not delete another user's book" do
  other_book = books(:two)

  assert_no_difference("Book.count") do
    delete book_url(other_book)
  end

  assert_redirected_to books_url
  assert Book.exists?(other_book.id)
end
end
