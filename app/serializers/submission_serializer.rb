class SubmissionSerializer < ActiveModel::Serializer
  attributes :id, :submit_type, :title, :body, :submit_object
  has_one :user
end
