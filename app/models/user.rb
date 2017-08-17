class User < ApplicationRecord
  has_merit

  has_secure_password
  has_secure_token
end
