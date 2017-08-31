class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :action, :trackable_type, :trackable_id, :callsign, :user_id
  # has_one :user

  def callsign
    object.user.callsign
  end

end
