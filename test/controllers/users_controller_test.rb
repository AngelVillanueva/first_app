require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should get users" do
  	get users_path
  	assert_response :success
  end

  test "should get user" do
    @user.save
  	get user_path(@user)
  	assert_response :success
  end

end
