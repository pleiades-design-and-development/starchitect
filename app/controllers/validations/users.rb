module Validate
  class User
    include ActiveModel::Validations

    attr_accessor :callsign, :firstname, :lastname, :email, :password, :password_confirmation

    validates :callsign, presence: true, length: { in: 3..16 }
    validates :firstname, presence: true, length: { maximum: 20 }, format: { with: /\A[a-zA-Z]+\z/,
    message: "No numbers, please!" }
    validates :lastname, presence: true, length: { maximum: 20 }, format: { with: /\A[a-zA-Z]+\z/,
    message: "No numbers, please!" }
    validates :email, presence: true
    validates :password, presence: true, confirmation: true
    validates :password_confirmation, presence: true

    def initialize(params={})
      @callsign = params[:callsign]
      @firstname = params[:firstname]
      @lastname = params[:lastname]
      @email = params[:email]
      @password = params[:password]
      @password_confirmation = params[:password_confirmation]



      ActionController::Parameters.new(params).permit(:callsign, :firstname, :lastname, :email, :password, :password_confirmation)
    end

  end
end
