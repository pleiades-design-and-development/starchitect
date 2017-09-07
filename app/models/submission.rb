class Submission < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :body, presence: true
end
