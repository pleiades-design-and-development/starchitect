class ActivitiesController < ApplicationController

  def index
    @activities = Activity.order('created_at DESC')
    render json: @activities
  end

  def merit_activity_index
    @merit_activities = Merit_activity_logs.all
    render json: @merit_activity_logs

  def create
    @Activity = Activity.new(act_params)
  end

  private

  def act_params
    params.permit(:id, :user_id, :action, :trackable_type)
  end
end
