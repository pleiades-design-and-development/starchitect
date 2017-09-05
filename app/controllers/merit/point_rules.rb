# Be sure to restart your server when you modify this file.
#
# Points are a simple integer value which are given to "meritable" resources
# according to rules in +app/models/merit/point_rules.rb+. They are given on
# actions-triggered, either to the action user or to the method (or array of
# methods) defined in the +:to+ option.
#
# 'score' method may accept a block which evaluates to boolean
# (recieves the object as parameter)

module Merit
  class PointRules
    include Merit::PointRulesMethods

    def initialize
      score 100, :on => 'users#create' do |user|
        user.callsign.present?
      end

      score 20, :on => 'submissions#create'
      score (-20), :on => 'submissions#destroy'
      score 20, :on => "comments#create"
      score (-20), :on => "comments#destroy"

    end
  end
end
