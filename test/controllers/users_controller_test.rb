require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    @user.save!
    post "/api/v1/login", params: {callsign: @user.callsign, password: 'secret', api_token: @user.api_token}
  end

  test "get users index" do

    get "/api/v1/users"

    assert_equal 200, response.status

  end

  test "get individual user" do

    get "/api/v1/users/1"
    assert_equal 200, response.status
  end

  test "create a user" do
    assert_difference('User.count') do
      post "/api/v1/signup", params: {firstname: "Dave", lastname: "Thomas", callsign: "Wendy", email: "dave@thomas.com", password: "testpass", password_confirmation: "testpass" }, as: :json
  end

    assert_equal 201, response.status
  end

  test "update a user" do

      put "/api/v1/users/1", params: {firstname: "Dave", lastname: "Thomas", callsign: "Wendy", email: "dave@thomas.com", password: "testpass", password_confirmation: "testpass", admin: true }

    assert_equal 200, response.status

  end

  test "delete a user" do
    assert_difference ('User.count'), -1 do
    delete "/api/v1/users/4"
  end

    assert_equal 204, response.status
  end
end
