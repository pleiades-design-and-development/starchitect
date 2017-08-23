class ActivitiesController < ApplicationController

  def index
    @activities = Activity.order('created_at DESC')
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
