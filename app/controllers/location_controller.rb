class LocationController < ApplicationController
  def index
  end

  def create
  end

  def show
    @location = Location.find(params[:id])
  end
end
