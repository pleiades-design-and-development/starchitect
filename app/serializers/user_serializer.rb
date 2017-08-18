class UserSerializer < ActiveModel::Serializer

  attributes :callsign, :firstname, :lastname, :email
  has_many :badges

end
