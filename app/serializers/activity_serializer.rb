class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :action, :trackable_type
  has_one :user
end
