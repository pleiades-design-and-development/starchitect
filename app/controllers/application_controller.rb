class ApplicationController < ActionController::API
  before_action :cors_preflight_check
  after_action :cors_set_access_control_headers
    #current user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

    #validation params
  ActionController::Parameters.action_on_unpermitted_parameters = :raise

  rescue_from(ActionController::UnpermittedParameters) do |pme|
    render json: { error:  { unknown_parameters: pme.params } },
               status: :bad_request
  end

  def validate_params
    user = Validate::User.new(params)
    if !user.valid?
      render json: { error: user.errors } and return
    end
  end
    #permit OPTIONS, possibly unnecessary with rack-cors
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'

      render :text => '', :content_type => 'text/plain'

    end
  end
    #Cereal Eyes
  include ActionController::Serialization

end
