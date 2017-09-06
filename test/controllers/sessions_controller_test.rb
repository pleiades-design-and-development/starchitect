require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin)
    @user.save!
  end

  test "login" do
    post '/api/v1/login', params: @user
    assert_response :success
  end

end
