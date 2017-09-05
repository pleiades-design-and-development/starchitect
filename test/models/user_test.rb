require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @valid_user = users(:valid_user)
  end

  test 'valid user' do
    assert User.new(firstname: 'First', lastname: 'Last', callsign: 'FirstLast', email: 'herp@derp.com', password: 'password', password_confirmation: 'password').valid?
  end

  test 'invalid_user' do
    # assert_not @invalid_user.valid?
    assert_not User.new(firstname: 'First1', lastname: 'Last2', callsign: 'FirstLast', email: 'herp@derp', password: 'password', password_confirmation: 'password').valid?
  end


end
