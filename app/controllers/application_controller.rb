class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

    #Cereal Eyes
  include ActionController::Serialization

    #Authentication
  def require_login
    authenticate_token || render_unauthorized("Access denied")
  end

  def logged_in?
    current_user != nil
  end

  def current_user
    @current_user ||= authenticate_token
  end

  protected

  def render_unauthorized(message)
    errors = { errors: [ { detail: message } ] }
    render json: errors, status: :unauthorized
  end

  private

  def authenticate_token
    authenticate_with_http_token do |token, options|
      User.find_by(api_token: token)
    end
  end

  def track_activity(trackable, action = params[:action])
    current_user.activities.create! action: action, trackable: trackable
  end

end
