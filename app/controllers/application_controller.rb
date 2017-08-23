class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  # before_action :cors_preflight_check
  # after_action :cors_set_access_control_header

    #permit OPTIONS, possibly unnecessary with rack-cors
  # def cors_set_access_control_headers
  #   headers['Access-Control-Allow-Origin'] = '*'
  #   headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
  #   headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
  #   headers['Access-Control-Max-Age'] = "1728000"
  # end
  #
  # def cors_preflight_check
  #   if request.method == 'OPTIONS'
  #     headers['Access-Control-Allow-Origin'] = '*'
  #     headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
  #     headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
  #     headers['Access-Control-Max-Age'] = '1728000'
  #
  #     render :text => '', :content_type => 'text/plain'
  #
  #   end
  # end

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

end
