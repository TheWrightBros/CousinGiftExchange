require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def setup
    @user = User.new(name: "testUser", email: "testemail@gmail.com", password: "foobar")
  end

  test "user is valid" do
    assert @user.valid?
  end

  # Name tests
  test "user with no username is not valid" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "name with more than 50 characters is invalid" do
    @user.name = 'aaaaa'*11
    assert_not @user.valid?
  end

  # Email tests
  test "email is invalid without an @" do
    @user.email = "johngmail.com"
    assert_not @user.valid?
  end

  test "email is invalid when over 255 characters" do
    @user.email = "jjjjj" * 60 #results in 300 character email
    assert_not @user.valid?
  end

  test "email is not valid when blank" do
    @user.email = ""
    assert_not @user.valid?
  end

  # Password Tests
  test "password should be present (nonblank)" do
    @user.password = "   "
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = "a" * 5
    assert_not @user.valid?
  end

end
