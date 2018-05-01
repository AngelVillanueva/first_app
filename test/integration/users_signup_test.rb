require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # def setup
  #   @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  # end

  test "should not create a new user without name" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert flash[:danger]
  end

  test "should create a new user with all the data" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "example user",
                                         email: "user@valid.com",
                                         password:              "foobar",
                                         password_confirmation: "foobar" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert flash[:success]
  end

  # test "should get users" do
  # 	get users_path
  # 	assert_response :success
  # end

  # test "should get user" do
  #   @user.save
  # 	get user_path(@user)
  # 	assert_response :success
  # end

end