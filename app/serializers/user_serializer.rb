class UserSerializer < ActiveModel::Serializer
  attributes :id, :callsign, :firstname, :lastname, :email, :level, :rank, :admin, :sash_id
end
