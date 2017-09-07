class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  # Cereal Eyes
  include ActionController::Serialization

  # Authentication
  def require_login
    authenticate_user || render_unauthorized('Access denied')
  end

  def logged_in?
    current_user != nil
  end

  def current_user
    @current_user ||= authenticate_user
  end

  # unit tests for both
  # acceptance test if applicable (can I sign in and do the things that need signed in for?)

  protected

  def render_unauthorized(message)
    errors = { errors: [{ detail: message }] }
    render json: errors, status: :unauthorized
  end

  private

  def authenticate_user
    authenticate_with_http_token do |token, _options|
      User.find_by(api_token: token)
    end
  end

  def track_activity(trackable, action = params[:action])
    current_user.activities.create! action: action, trackable: trackable
  end
end
