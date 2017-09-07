class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :action, :trackable_type, :trackable_id, :callsign, :sash_callsign, :user_id
  # has_one :user

  def callsign
    object.user.callsign
  end

  def sash_callsign
    User.find_by(id: object.sash_id).callsign
  end
end
