class User < ApplicationRecord
  has_merit
  has_many :submissions

  has_secure_password
  has_secure_token :api_token

  validates :password, length: { in: 8..16 }

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
