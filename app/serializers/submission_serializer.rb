class SubmissionSerializer < ActiveModel::Serializer
  attributes :id, :type, :title, :body, :object
  has_one :user
end
