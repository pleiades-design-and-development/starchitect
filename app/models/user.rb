class User < ApplicationRecord
  has_merit
  has_many :comments, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  has_secure_password
  has_secure_token :api_token

  # validates_attachment :avatar, presence: true,
  #   content_type: { content_type: "image/jpeg" },
  #   size: { in: 0..1.megabytes }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes
  validates :callsign, presence: true, uniqueness: true, format: { with: /[a-zA-Z0-9]/, message: "Callsign must be letters and numbers only."}
  validates :firstname, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "First name must be letters only." }
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
