class SessionsController < ApplicationController

    skip_before_action :require_login, only: [:create], raise: false

    def create
      if user = User.valid_login?(params[:callsign], params[:password])
        allow_token_to_be_used_only_once_for(user)
        send_auth_token_for_valid_login_of(user)
      else
        render_unauthorized("Error with your login or password")
      end
    end

    def destroy
      logout
      head :ok
    end

    private

    def send_auth_token_for_valid_login_of(user)
      render json: { api_token: user.api_token }
    end

    def allow_token_to_be_used_only_once_for(user)
      user.regenerate_api_token
    end

    def logout
      current_user.invalidate_api_token
    end
end
