module Validate
  class User
    include ActiveModel::Validations

    attr_accessor :callsign, :firstname, :lastname, :email

    validates :callsign, presence: true, length: { in: 3..16 }
    validates :firstname, presence: true, length: { maximum: 20 }, format: { with: /\A[a-zA-Z]+\z/,
    message: "No numbers, please!" }
    validates :lastname, presence: true, length: { maximum: 20 }, format: { with: /\A[a-zA-Z]+\z/,
    message: "No numbers, please!" }
    validates :email, presence: true
    # validates :password, presence: true, confirmation: true, length: { in: 8..16 }
    # validates :password_confirmation, presence: true, length: { in: 8..16 }

    def initialize(params={})
      @user = {
      @callsign => params[:callsign],
      @firstname => params[:firstname],
      @lastname => params[:lastname],
      @email => params[:email],
      # @password => params[:password],
      # @password_confirmation => params[:password_confirmation]
      }

      def user_params
        ActionController::Parameters.new(params).require(:user).permit(:callsign, :firstname, :lastname, :email)
      end

    end
  end
end
