require 'test_helper'

class UserLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    @user2 = User.new(name: "Example User 2", email: "user2@example.com", password: "foobar", password_confirmation: "foobar")
    @users = [@user, @user2]
  end
  test "user data" do
    @users.each do |user|
      user.save

      get user_path(user)
      assert_template 'users/show'
      assert_select "h1", count: 1
      assert_select "h1", user.name
      assert_select "img.gravatar", count: 1
      assert_select "p", count: 1
      assert_select "p", user.email
    end
  end
end