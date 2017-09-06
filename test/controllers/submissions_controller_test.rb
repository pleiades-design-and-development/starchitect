require 'test_helper'

class SubmissionsControllerTest < ActionDispatch::IntegrationTest

  setup do

    @current_user = users(:valid_user)


    # @request.headers['Authorization'] = ActionController::HttpAuthentication::Basic.
    #   encode_credentials(@current_user.callsign, 'secret')

    @submission = submissions(:one)
  end

  test "should get index" do
    get "/api/v1/submissions", as: :json
    assert_response :success
  end

  test "should create submission" do

    assert_difference('Submission.count') do
      post "/api/v1/submissions", params: { body: @submission.body, title: @submission.title, submit_type: @submission.submit_type, user_id: @current_user.id, submit_object: @submission.submit_object }, as: :json
    end

    assert_response 201
  end

  test "should show submission" do
    get submission_url(@submission), as: :json
    assert_response :success
  end

  test "should update submission" do
    patch submission_url(@submission), params: { submission: { body: @submission.body, title: @submission.title, submit_type: @submission.submit_type, user_id: @current_user.id } }, as: :json
    assert_response 200
  end

  test "should destroy submission" do
    assert_difference('Submission.count', -1) do
      delete submission_url(@submission), as: :json
    end

    assert_response 204
  end

  private


end
