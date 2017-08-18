class UserSerializer < ActiveModel::Serializer

  attributes :callsign, :firstname, :lastname, :email, :rank, :level
  has_many :badges

end
