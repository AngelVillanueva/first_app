require 'test_helper'

class UsersLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    @user2 = User.new(name: "Example User 2", email: "user2@example.com", password: "foobar", password_confirmation: "foobar")
    @users = [@user, @user2]
  end
  test "users list" do
    @users.each do |user|
      user.save
    end

    get users_path
    assert_template 'users/index'
    assert_select "ul.users", count: 1
    assert_select "li.user", count: 2
    assert_select "p.name", @users.first.name
    assert_select "p.name", @users.last.name
  end
end