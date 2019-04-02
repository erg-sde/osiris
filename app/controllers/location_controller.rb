class LocationController < ApplicationController
  def index
    @locations = Location.all
  end

  def create
  end

  def show
    @location = Location.find(params[:id])
  end
end
