class UserSerializer < ActiveModel::Serializer

  attributes :callsign, :firstname, :lastname, :email, :rank, :level, :api_token
  has_many :badges
  has_one :points

end
