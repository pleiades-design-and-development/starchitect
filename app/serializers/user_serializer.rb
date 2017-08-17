class UserSerializer < ActiveModel::Serializer
  attributes :callsign, :firstname, :lastname, :email
  has_many :badges
  # def password_digest
  #   binding.pry
  # end

  # attributes :id, :callsign, :firstname, :lastname, :email, :level, :rank, :admin, :sash_id, :password_digest

end
