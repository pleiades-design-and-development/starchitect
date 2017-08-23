class ActivitiesController < ApplicationController
  @activities = Activity.order('created_at desc')
end
