class SubmissionSerializer < ActiveModel::Serializer
  attributes :id, :submit_type, :title, :body, :submit_object, :callsign
  has_one :user

  def callsign
    object.user.callsign
  end
end
