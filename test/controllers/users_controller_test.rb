
require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)

    post session_url, params: {
      name: @user.name,
      password: "password"
    }
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get show" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end


  test "should not edit another user's profile" do
    other_user = users(:two)

    get edit_user_url(other_user)

    assert_redirected_to user_url(@user)
  end

  test "should not update another user's profile" do
    other_user = users(:two)
    original_name = other_user.name

    patch user_url(other_user), params: {
      user: { name: "Unauthorized Name" }
    }

    assert_redirected_to user_url(@user)
    assert_equal original_name, other_user.reload.name
  end
end
