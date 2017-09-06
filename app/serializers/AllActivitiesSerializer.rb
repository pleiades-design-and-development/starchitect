class AllActivitiesSerializer < ActiveModel::Serializer
  has_many :activities, embed: :objects
  has_many :merit_index, embed: :objects
end
