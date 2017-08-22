class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity.order('created_at desc')
    render json: @activities
  end
end
