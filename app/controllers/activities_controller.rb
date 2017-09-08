class ActivitiesController < ApplicationController
  # before_action :require_login

  def index
    @activities = Activity.all
    @merit_index = Merit::BadgesSash.all
    @all_activities = @activities + @merit_index
    @all_activities.sort_by!(&:created_at).reverse!


    render json: @all_activities
  end

  def create
    @Activity = Activity.new(act_params)
  end

  private

  #   json.all_activities do
  #   json.callsign @activities.user.callsign || User.find_by(id: object.sash_id).callsign
  #   json.action @activities.action || "create"
  #   json.tractable_type @activities.tractable_type || "badge"
  #   json.trackable_id @activities.trackable_id || object.badge_id
  # end

  def act_params
    params.permit(:id, :user_id, :action, :trackable_type)
  end
end
