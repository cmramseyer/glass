class ActivitiesController < ApplicationController

  def index
    @activities = Activity.last(10).reverse
  end
  
end
