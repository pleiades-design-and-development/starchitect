class UserSerializer < ActiveModel::Serializer

  attributes :callsign, :firstname, :lastname, :email, :password, :password_confirmation
  has_many :badges

end
