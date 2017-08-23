class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :action, :trackable_type
  has_one :user
  has_one :trackable
end
