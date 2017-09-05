class ActivitiesController < ApplicationController

  # before_action :require_login

  def index
    @activities = Activity.all
    # @merit_index = Merit::BadgesSash.all
    # @all_activities = @activities + @merit_index
    # @all_activities.sort_by! {|entry| entry.created_at}.reverse!

    render json: @activities
  end

  def create
    @Activity = Activity.new(act_params)
  end

  private

  def act_params
    params.permit(:id, :user_id, :action, :trackable_type)
  end
end
