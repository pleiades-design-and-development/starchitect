class ActivitiesController < ApplicationController
  def index
    @activities = Activity.order('created_at desc')
  end

  def create
    @Activity = Activity.new(act_params)
  end

  private

  def act_params
    params.permit(:id, :user_id, :action, :trackable)
  end
end
