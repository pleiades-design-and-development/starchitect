class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :trackable, polymorphic: true
  attr_accessor :action, :trackable

end
