class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :action, :trackable
  has_one :user
end
