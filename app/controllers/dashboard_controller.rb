class DashboardController < ApplicationController
  before_filter :authenticate_user!
    
  def show
    if current_user
      @locations = current_user.locations    
      @location = current_user.locations.new
    end
  end
end
