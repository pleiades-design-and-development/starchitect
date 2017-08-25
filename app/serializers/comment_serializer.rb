class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :commentable_type
  has_one :user
end
