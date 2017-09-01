class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :action, :trackable_type, :trackable_id, :callsign, :sash_callsign, :user_id
  # has_one :user

  def callsign
      User.find_by_id(object.user_id).callsign
  end

  def sash_callsign
      User.find_by_id(object.sash_id).callsign
  end

end
