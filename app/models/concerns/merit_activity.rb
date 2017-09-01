module MeritActivity

  extend ActiveSupport::Concern

  included do
    after_save :track_activity
  end

  def track_activity
    derp = current_user.activities.new(action: "update", trackable: self.badge, user_id: User.find_by(sash_id: self.sash.id).id)

    derp.save

  end
end
