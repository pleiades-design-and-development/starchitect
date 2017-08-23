class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all
    render json: @activities
  end

  def create
    @Activity = Activity.new(act_params)
  end

  private

  def act_params
    params.permit(:id, :user_id, :action, :trackable)
  end
end
