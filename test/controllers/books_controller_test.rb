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
end