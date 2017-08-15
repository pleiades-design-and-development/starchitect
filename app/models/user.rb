class User < ApplicationRecord
  has_merit

  has_secure_password
end
