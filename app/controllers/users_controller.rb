class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :validate_params, only: [:create, :update]


  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end


  def create
    @user = User.new(user_params)

    if @user.save

      session[:user_id] = @user.id

      render json: @user, status: :created

    else
      render json: @user.errors, status: :unprocessable_entity
    end

  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  rescue_from(ActionController::UnpermittedParameters) do |pme|
    render json: { error:  { unknown_parameters: pme.params } },
               status: :bad_request
  end

  private

      def validate_params
        user = Validate::Location.new(params)
        if !user.valid?
          render json: { error: user.errors } and return
        end
      end

  def user_params
    params.permit(:firstname, :lastname, :email, :callsign, :rank, :level, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
