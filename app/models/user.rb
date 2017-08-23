class User < ApplicationRecord
  has_merit
  has_many :submissions

  has_secure_password
  has_secure_token :api_token

  validates :callsign, presence: true, uniqueness: true, format: { with: /[a-zA-Z0-9]/, message: "Callsign must be letters and numbers only."}
  validates :firstname, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "First name my be letters only." }
  validates :lastname, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "Last name must be letters only." }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Must be a valid email address." }


  def invalidate_token
    self.update_columns(api_token: nil)
  end

  def self.valid_login?(callsign, password)
    user = find_by(callsign: callsign)
    if user && user.authenticate(password)
      user
    end
  end

end
