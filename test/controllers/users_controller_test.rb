require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup

    ApplicationController.any_instance.stubs(:current_user).returns(users(:admin))
    ApplicationController.any_instance.stubs(:require_login).returns(users(:admin))
    @user = users(:one)

  end

  test 'get users index' do

    get :index

    assert_equal 200, response.status

  end


  test 'get individual user' do

    get :show, params: { id: @user.id }

    assert_equal 200, response.status
  end


  test 'create a user' do
    assert_difference('User.count') do
      post :create, params: {
                              firstname: 'Dave',
                              lastname: 'Thomas',
                              callsign: 'Wendy',
                              email: 'dave@thomas.com',
                              password: 'testpass',
                              password_confirmation: 'testpass'
                            },
                            as: :json
    end

    assert_equal 201, response.status

  end


  test 'update a user' do
    put :update, params: {
                           id: @user.id,
                           user: { admin: true }
                         },
                          as: :json
    assert_equal 200, response.status

  end

  test 'delete a user' do
    assert_difference ('User.count'), -1 do
      delete :destroy, params: { id: @user.id}
    end

    assert_equal 204, response.status
  end
end
