require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @current_user = users(:admin)
  end

  test "get users index" do

    get "/api/v1/users"

    assert_equal 200, response.status

  end
end
