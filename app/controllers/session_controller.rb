class SessionController < ApplicationController
  def new
  end

  def create
      user = User.find_by_api_token(params[:api_token])
      # If the user exists AND the password entered is correct.
      if user && user.authenticate(params[:password])
        # Save the user id inside the browser cookie. This is how we keep the user
        # logged in when they navigate around our website.
        render json: user, serializer: LoginSerializer
        redirect_to '/'
      else
      # If user's login doesn't work, send them back to the login form.
        redirect_to '/login'
      end
  end

    def destroy
      session[:user_id] = nil
      redirect_to '/'
    end

end
