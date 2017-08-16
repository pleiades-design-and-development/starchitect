class SubmissionSerializer < ActiveModel::Serializer
  attributes :id, :type, :title, :body
  has_one :user
end
