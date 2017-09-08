require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'mocha/mini_test'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # module SignInHelper
  #   def current_user
  #     ApplicationController.current_user
  #     # @current_user ||= authenticate_token
  #   end
  #
  #   def authenticate_token
  #     authenticate_with_http_token do |token, options|
  #       User.find_by(api_token: token)
  #     end
  #   end
  # end
  #
  # class ActionDispatch::IntegrationTest
  #   include SignInHelper
  # end
end
