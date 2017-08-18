class User < ApplicationRecord
  has_merit

  has_secure_password
  
  validates :password,
    presence: { on: :create },
    length: { minimum: 8, allow_blank: true }

  has_secure_token :api_token



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
