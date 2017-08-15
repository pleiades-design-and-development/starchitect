class UsersController < ApplicationController

  def new
      @new_user = User.all
  end

    def create
      user = User.new(user_params)
      if user.save
        redirect_to '/'
      else
        redirect_to '/signup'
      end
    end

private

  def user_params
    params.require(:user).permit(:callsign, :password, :password_confirmation)
  end

end
