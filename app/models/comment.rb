class Comment < ApplicationRecord

  belongs_to :user
  belings_to :commentable, polymorphic: true

end
