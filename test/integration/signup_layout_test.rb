require 'test_helper'

class SignupLayoutTest < ActionDispatch::IntegrationTest
  # def setup
  #   @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  #   @user2 = User.new(name: "Example User 2", email: "user2@example.com", password: "foobar", password_confirmation: "foobar")
  #   @users = [@user, @user2]
  # end
  test "user signup" do

    get signup_path
    assert_template 'users/new'
    assert_select "form", count: 1
    assert_select "label[for="name"]", count: 1
    assert_select "label[for="email"]", count: 1
    assert_select "label[for="password"]", count: 1
    assert_select "label[for="password_confirmation"]", count: 1
    assert_select "submit", count: 1
    # assert_select "p.name", @users.last.name
  end
end