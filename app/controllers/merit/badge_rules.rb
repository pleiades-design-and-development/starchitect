
# Be sure to restart your server when you modify this file.
#
# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+votes: 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize
      grant_on 'users#create', badge_id: 1, badge: 'new_cadet', to: :itself


      grant_on 'submissions#create', badge_id: 2, badge: 'first_submit' do |submission|
          submission.user.submissions.count === 1
        end

      grant_on 'submissions#create', badge: 'first-create-submit' do |submission|
        submission.user.submissions.where(:submit_type => 'create').count === 1
        end

      grant_on 'submissions#create', badge: 'first-explore-submit' do |submission|
        submission.user.submissions.where(:submit_type => 'explore').count === 1
        end

      grant_on 'submissions#create', badge: 'five-submits' do |submission|
        submission.user.submissions.count === 5
        end

      grant_on 'submissions#create', badge: 'five-explore-submits' do |submission|
        submission.user.submissions.where(:submit_type => 'explore').count === 5
        end

      grant_on 'submissions#create', badge: 'five-create-submits' do |submission|
        submission.user.submissions.where(:submit_type => 'create').count === 5
        end

      grant_on 'submissions#create', badge: 'ten-submits' do |submission|
        submission.user.submissions.count === 10
        end

      grant_on 'submissions#create', badge: 'ten-create-submits' do |submission|
        submission.user.submissions.where(:submit_type => 'create').count === 10
        end

      grant_on 'submissions#create', badge: 'ten-explore-submits' do |submission|
        submission.user.submissions.where(:submit_type => 'explore').count === 10
        end

      grant_on 'submissions#create', badge: 'fifteen-submits' do |submission|
        submission.user.submissions.count === 15
        end

      grant_on 'submissions#create', badge: 'fifteen-create-submits' do |submission|
        submission.user.submissions.where(:submit_type => 'create').count === 15
        end

      grant_on 'submissions#create', badge: 'fifteen-explore-submits' do |submission|
        submission.user.submissions.where(:submit_type => 'explore').count === 15
        end

      grant_on 'submissions#create', badge: 'twenty-submits' do |submission|
        submission.user.submissions.count === 20
        end

      grant_on 'submissions#create', badge: 'twenty-create-submits' do |submission|
        submission.user.submissions.where(:submit_type => 'create').count === 20
        end

      grant_on 'submissions#create', badge: 'twenty-explore-submits' do |submission|
        submission.user.submissions.where(:submit_type => 'explore').count === 20
        end

      grant_on 'comments#create', badge: 'first-comment' do |comment|
        comment.user.comments.count === 20
        end

      grant_on 'comments#create', badge: 'five-comments' do |comment|
      comment.user.comments.count === 20
      end

      grant_on 'comments#create', badge: 'fifteen-comments' do |comment|
      comment.user.comments.count === 20
      end

      grant_on 'comments#create', badge: 'twenty-comments' do |comment|
      comment.user.comments.count === 20
      end








      # If it creates user, grant badge
      # Should be "current_user" after registration for badge to be granted.
      # Find badge by badge_id, badge_id takes presidence over badge
      # grant_on 'users#create', badge_id: 7, badge: 'just-registered', to: :itself

      # If it has 10 comments, grant commenter-10 badge
      # grant_on 'comments#create', badge: 'commenter', level: 10 do |comment|
      #   comment.user.comments.count == 10
      # end

      # If it has 5 votes, grant relevant-commenter badge
      # grant_on 'comments#vote', badge: 'relevant-commenter',
      #   to: :user do |comment|
      #
      #   comment.votes.count == 5
      # end

      # Changes his name by one wider than 4 chars (arbitrary ruby code case)
      # grant_on 'registrations#update', badge: 'autobiographer',
      #   temporary: true, model_name: 'User' do |user|
      #
      #   user.name.length > 4
      # end
    end
  end
end
